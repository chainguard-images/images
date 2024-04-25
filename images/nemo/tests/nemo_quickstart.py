# Sourced from the NeMo quickstart guide
# https://docs.nvidia.com/nemo-framework/user-guide/latest/nemotoolkit/starthere/intro.html#quick-start-guide

# Import NeMo's ASR, NLP and TTS collections
from nemo.collections import asr, nlp, tts

import requests

# Download an audio file that we will transcribe, translate, and convert to speech
r = requests.get(
    "https://nemo-public.s3.us-east-2.amazonaws.com/zh-samples/common_voice_zh-CN_21347786.mp3"
)
with open("voice.mp3", "wb") as f:
    f.write(r.content)


# Instantiate a Mandarin speech recognition model and transcribe an audio file.
asr_model = asr.models.ASRModel.from_pretrained(
    model_name="stt_zh_citrinet_1024_gamma_0_25"
)
mandarin_text = asr_model.transcribe(["voice.mp3"])
print(mandarin_text)

# Instantiate Neural Machine Translation model and translate the text
nmt_model = nlp.models.MTEncDecModel.from_pretrained(
    model_name="nmt_zh_en_transformer24x6"
)
english_text = nmt_model.translate(mandarin_text)
print(english_text)

###


# # Instantiate a spectrogram generator (which converts text -> spectrogram)
# # and vocoder model (which converts spectrogram -> audio waveform)
# spectrogram_generator = tts.models.FastPitchModel.from_pretrained(model_name="tts_en_fastpitch")
# vocoder = tts.models.HifiGanModel.from_pretrained(model_name="tts_en_hifigan")

# # Parse the text input, generate the spectrogram, and convert it to audio
# parsed_text = spectrogram_generator.parse(english_text[0])
# spectrogram = spectrogram_generator.generate_spectrogram(tokens=parsed_text)
# audio = vocoder.convert_spectrogram_to_audio(spec=spectrogram)

# # Save the audio to a file
# import soundfile as sf
# sf.write("output_audio.wav", audio.to('cpu').detach().numpy()[0], 22050)
