Google Study Jam
================
# 3. Speech to Text Transcription with the Cloud Speech API

### overview
 * Cloud Speech API는 80가지 이상의 언어로 오디오 파일에서 텍스트 transcription을 speech할 수 있다.
 1. Speech API request를 만들고 curl로 API를 부른다.
 2. 다른언어의 오디오 파일로 Speech API를 부른다.
 
### Lab
 1. API key를 생성한다.
 2. Speech API request를 만든다.
 3. Speech API를 부른다.
     * 여기까지는 1. Google Cloud Speech API: Qwik Start과 같다
 4. 다른 언어로 text transcription을 speech한다.
     * Speech API의 경우 100가지 언어 이상을 text transcription할 수 있다.
     * _request.json_파일을 변경하면 된다<br/>
     ``` vi request.json ```
     >  {
          "config": {
              "encoding":"FLAC",
              "languageCode": "fr"
          },
          "audio": {
              "uri":"gs://speech-language-samples/fr-sample.flac"
          }
        }
     * 결과
     > {
          "results": [
            {
              "alternatives": [
                {
                  "transcript": "maître corbeau sur un arbre perché tenait en son bec un fromage",
                  "confidence": 0.9710122
                }
              ]
            }
          ]
        }
     







> 여러나라의 음성들도 언어로 변환할 수 있다.



[출처](https://www.qwiklabs.com/focuses/2187?catalog_rank=%7B%22rank%22%3A5%2C%22num_filters%22%3A3%2C%22has_search%22%3Atrue%7D&parent=catalog&search_id=1896403)
