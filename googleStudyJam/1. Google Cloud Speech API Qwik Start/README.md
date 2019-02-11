 Google study Jam
=========================
# 1. Google Cloud Speech API: Qwik Start

### overview
 1. API key �����ϱ�
 2. Speech API request �����
 3. Speech API request �θ���
 * google cloud service���� api key�� �����Ͽ� �۾��Ѵ�.
 
 
### Lab
 1. ������ �������� �α����� �� �������̽����� API key�� �߱޹޴´�.


 2. cmd�� �̿��Ͽ� active account�� Ȯ���� �� �ִ�.
    * name ���<br/>
       ` gcloud auth list`
    * project ID ��� <br/>
       ` gcloud config list project`


 3. API key�� ȯ�溯���� ���<br/>
     ` export API_KEY=<MY_APT_KEY>`
     
     
 4. Speech API request �����ϱ�
    * request.json ���� ����<br/>
       ` touch request.json `
       > touch: ������ ��¥ �ð� ������ �����ϴ� ��ɾ� 
              [����](https://webdir.tistory.com/151)
    * request.json ���� �ۼ�
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
        * _encoding_: �� parameter�� ��� API���� � Ÿ���� audio encoding(API�� �������� ����)�� ����� �� �����ִ� ���̴�.
            * sample_rate�� ��� api�� ������ audio data�� �츣���̴�.(�ӵ�)
            * [�ڼ��� ���� ���� ����](https://cloud.google.com/speech-to-text/docs/reference/rest/v1/RecognitionConfig)
        * _audio_: �� object�� Cloud Storage�� audio file�� uri�� API�� �����ϴ� ���̴�.
        
        
 5. Speech API �θ��� <br/>
      `curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json "https://speech.googleapis.com/v1beta1/speech:syncrecognize?key=${API_KEY}" `
      * ���
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
        * _transcript_: audio file�� Speech API�� text transcription ��ȯ��
        * _confidence_: API�� ���� AUDIO�� ��Ȯ�ϰ� transcribe �ߴ��� ������ ��
      

> �̰� ������ �ؽ�Ʈ�� ��ȯ���ִ� �ǰ�...?
      
      
      

[��ó](https://google.qwiklabs.com/focuses/588?parent=catalog)