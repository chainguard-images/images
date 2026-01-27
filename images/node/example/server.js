const express = require('express')

const app = express()

app.get('/test', (req, res) => {
  res.send('payload')
})

app.listen(8000)
