import sys
from grpc import insecure_channel
from ml_metadata.proto import metadata_store_pb2
from ml_metadata.proto import metadata_store_service_pb2
from ml_metadata.proto import metadata_store_service_pb2_grpc

def main():
	channel = insecure_channel(sys.argv[1])
	stub = metadata_store_service_pb2_grpc.MetadataStoreServiceStub(channel)

	artifact_type = metadata_store_pb2.ArtifactType(name='MyArtifactType',
																									properties={'property_1': metadata_store_pb2.INT,
																															'property_2': metadata_store_pb2.STRING})
	put_type_request = metadata_store_service_pb2.PutArtifactTypeRequest(artifact_type=artifact_type)
	print("PutArtifactTypeRequest:")
	print(put_type_request)
	artifact_type_id = stub.PutArtifactType(put_type_request).type_id
	print("Artifact type id:")
	print(artifact_type_id)
	print("GetArtifactTypesResponse:")
	print(stub.GetArtifactTypes(metadata_store_service_pb2.GetArtifactTypesRequest()))

	artifact = metadata_store_pb2.Artifact(type_id=artifact_type_id,
																				properties={'property_1': metadata_store_pb2.Value(int_value=123),
																										'property_2': metadata_store_pb2.Value(string_value='example value')})
	put_artifacts_request = metadata_store_service_pb2.PutArtifactsRequest(artifacts=[artifact])
	print("PutArtifactsRequest:")
	print(put_artifacts_request)
	put_artifacts_response = stub.PutArtifacts(put_artifacts_request)
	print("PutArtifactsResponse:")
	print(put_artifacts_response)

	channel.close()

if __name__ == "__main__":
	main()
	print("Done")

