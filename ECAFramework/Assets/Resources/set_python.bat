CALL D:\tts\Scripts\activate.bat
set PYTHONIOENCODING=UTF-8
set PYTHONLEGACYWINDOWSSTDIO=UTF-8
set PYTHONUTF8=1
tts --text "I'm sure that you have a cure for this." --model_name tts_models/en/ljspeech/tacotron2-DDC --out_path Assets\Resources\Audio\Patient.wav
