Google Study Jam
================
# 2. Cloud Natural Language API: Qwik Start

### overview
 * Google Cloud Natural Language API의 경우 text document나 뉴스 기사, 블로그 포스트 등의 사람, 장소, 이벤트 등등에 관한 정보를 추출할 수 있게 한다.
 * 이는 소셜 미디어나 메세지앱이나 콜센터에서 발생한 고객 대화로부터 parse intent에서 당신의 product에 관한 sentiment에 대해 이해할 수 있게 한다.
 * 분석을 위해 text document를 업로드 할 수 있다.
 
### Cloud Natural Language API의 특징
 1. Syntax Analysis: token과 setence를 추출하고 PoS(part of speech)를 확인(식별)하고, 각 sentence의 dependency parse tree를 생성한다.
 2. Entity Recognition: entity를 식별하고 사람, 조직, 장소, 이벤트, 상품, 미디어같은 type에 label을 붙인다.
 3. Sentiment Analysis: text의 블럭에서 표현된 전체 sentiment를 이해하게 한다.
 4. Content Classification: 미리 정의된 700개 이상의 카테고리의 document로 이해하게 한다.
 5. Multi-Language: 여러 언어의 text를 분석하기 쉽게 만든다.
 6. Intergrated REST API: REST API를 통해 ACCESS. 텍스트는 request로 업로드 되거나 Google Cloud Storage로 통합된다.
 
### Lab
 1. API key 생성하기(환경변수 설정하기)
     * PROJECT_ID의 환경변수를 설정한다.<br/>
     ```export GOOGLE_CLOUD_PROJECT=$(gcloud config get-value core/project)```
     * Natural Language API에 접근하기 위한 새 service account를 만든다.<br/>
     ```gcloud iam service-accounts create my-natlang-sa --display-name "my natural language service account"```
     * 그러고 credentials(자격)을 만들어 새 service account로 로그인 한다. 이 credential을 만들고 JSON 파일에 저장한다.<br/>
     ```gcloud iam service-accounts keys create ~/key.json --iam-account my-natlang-sa@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com```
     * 마지막으로 GOOGLE_APPLICATION_CREDENRIALS 환경변수를 맞춘다. 환결변수는 당신이 만든 credential JSON 파일의 전체 경로로 지정해 줘야 한다.<br/>
     ``` export GOOGLE_APPLICATION_CREDENTIALS="/home/USER/key.json" ```
 
 2. Entity Analysis Request를 만든다.
     * 이제 다음 문장으로 Natural Language API의 entity analysis를 시도해 본다.
         > Michelangelo Caravaggio, Italian painter, is known for 'The Calling of Saint Matthew'
     ''' gcloud ml language analyze-entities --content="Michelangelo Caravaggio, Italian painter, is known for 'The Calling of Saint Matthew'."'''
     * 결과<br/>
     >{
      "entities": [
        {
          "name": "Michelangelo Caravaggio",
          "type": "PERSON",
          "metadata": {
            "wikipedia_url": "http://en.wikipedia.org/wiki/Caravaggio",
            "mid": "/m/020bg"
          },
          "salience": 0.83047235,
          "mentions": [
            {
              "text": {
                "content": "Michelangelo Caravaggio",
                "beginOffset": 0
              },
              "type": "PROPER"
            },
            {
              "text": {
                "content": "painter",
                "beginOffset": 33
              },
              "type": "COMMON"
            }
          ]
        },
        {
          "name": "Italian",
          "type": "LOCATION",
          "metadata": {
            "mid": "/m/03rjj",
            "wikipedia_url": "http://en.wikipedia.org/wiki/Italy"
          },
          "salience": 0.13870546,
          "mentions": [
            {
              "text": {
                "content": "Italian",
                "beginOffset": 25
              },
              "type": "PROPER"
            }
          ]
        },
        {
          "name": "The Calling of Saint Matthew",
          "type": "EVENT",
          "metadata": {
            "mid": "/m/085_p7",
            "wikipedia_url": "http://en.wikipedia.org/wiki/The_Calling_of_St_Matthew_(Caravaggio)"
          },
          "salience": 0.030822212,
          "mentions": [
            {
              "text": {
                "content": "The Calling of Saint Matthew",
                "beginOffset": 69
              },
              "type": "PROPER"
            }
          ]
        }
      ],
      "language": "en"
    }

 
 
 
 
 > 문장에서 사람, 장소 등의 단어를 추출해 오는 구나
 
 
 
 [출처](https://google.qwiklabs.com/focuses/582?parent=catalog)