 Google study Jam
=========================
# 1. Google Cloud Speech API: Qwik Start

### overview
 1. API key 생성하기
 2. Speech API request 만들기
 3. Speech API request 부르기
 * google cloud service에서 api key를 생성하여 작업한다.
 
 
### Lab
 1. 제공된 계정으로 로그인한 후 인터페이스에서 API key를 발급받는다.


 2. cmd를 이용하여 active account를 확인할 수 있다.
    * name 출력<br/>
       ` gcloud auth list`
    * project ID 출력 <br/>
       ` gcloud config list project`


 3. API key를 환경변수로 등록<br/>
     ` export API_KEY=<MY_APT_KEY>`
     
     
 4. Speech API request 생성하기
    * request.json 파일 생성<br/>
       ` touch request.json `
       > touch: 파일의 날짜 시간 정보를 변경하는 명령어 
              [참고](https://webdir.tistory.com/151)
    * request.json 파일 작성
    ```
    {
          "config": {
              "encoding":"FLAC",
              "sample_rate": 16000,
              "language_code": "en-US"
          },
          "audio": {
              "uri":"gs://cloud-samples-tests/speech/brooklyn.flac"
          }
    }
    ```
        * _encoding_: 이 parameter의 경우 API에게 어떤 타입의 audio encoding(API에 보내려는 파일)을 사용할 지 말해주는 곳이다.
            * sample_rate의 경우 api에 보내는 audio data의 헤르츠이다.(속도)
            * [자세한 것은 여기 참조](https://cloud.google.com/speech-to-text/docs/reference/rest/v1/RecognitionConfig)
        * _audio_: 이 object는 Cloud Storage의 audio file의 uri를 API에 전달하는 것이다.
        
        
 5. Speech API 부르기 <br/>
      `curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json "https://speech.googleapis.com/v1beta1/speech:syncrecognize?key=${API_KEY}" `
      * 결과
      ```
      {
          "results": [
            {
              "alternatives": [
                {
                  "transcript": "how old is the Brooklyn Bridge",
                  "confidence": 0.98267895
                }
              ]
            }
          ]
    } 
```
        * _transcript_: audio file의 Speech API의 text transcription 반환값
        * _confidence_: API가 너의 AUDIO를 정확하게 transcribe 했는지 측정한 값
      

> 이거 음성을 텍스트로 변환해주는 건가...?
      
      
      

[출처](https://google.qwiklabs.com/focuses/588?parent=catalog)