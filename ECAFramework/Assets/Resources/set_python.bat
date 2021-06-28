CALL D:\tts\Scripts\activate.bat
set PYTHONIOENCODING=UTF-8
set PYTHONLEGACYWINDOWSSTDIO=UTF-8
set PYTHONUTF8=1
tts --text "There is something that I can do to solve this problem?" --model_name tts_models/en/ljspeech/tacotron2-DDC --out_path Assets\Resources\Audio\Patient.wav
