Google Study Jam
================
# 4. Entity and Sentiment Analysis with the Natural Language API

### overview

 * Cloud Natural Language API는 텍스트로부터 entity를 추출하고, 문맥과 문장을 형성하고, 텍스트를 카테고리로 classify할 수 있게 한다.

 * 이번 lab의 목표는 Natural Language API를 사용하여 entity, sentiment, syntax를 분석하는 것을 배우는 것이다.

    1. Natural Language API request를 만들고 curl을 통해 API 불러온다.
    2. entity를 추출하고 Natural Language API를 이용하여 텍스트의 sentiment를 분석한다.
    3. Natural Language API로 텍스트의 linguistic 분석을 perform한다.
    4. 다른 언어의 Natural Language API request를 만든다.
 
### Lab
 1. API key 생성하기<br/>
     ```export API_KEY=<YOUR_API_KEY>```
     
     
 2. Entity Analysis Request 만들기<br/>
     * API로 entity(사람이나 장소 이벤트 같은 것)을 추출할 수 있다. 
         > 문장<br/>
         Joanne Rowling, who writes under the pen names J. K. Rowling and Robert Galbraith, is a British novelist and screenwriter who wrote the Harry Potter fantasy series.
     * _request.json_파일에 요구사항을 적는다
     > {
          "document":{
            "type":"PLAIN_TEXT",
            "content":"Joanne Rowling, who writes under the pen names J. K. Rowling and Robert Galbraith, is a British novelist and screenwriter who wrote the Harry Potter fantasy series."
          },
          "encodingType":"UTF8"
        }
        
         * _type_: PLAIN_TEXT나 HTML을 사용한다.
         * _content_: 분석을 위해 NL API에 보낼 텍스트를 적는다. Cloud Storage에서 보내길 원한다면 content 대신에 gcsContentUri를 사용한다.
         * _encodingType_: 텍스트를 processing할 때 사용되는 text encoding의 타입을 말한다.
        
        
 3. Natural Language API 부르기<br/>
     ```curl "https://language.googleapis.com/v1/documents:analyzeEntities?key=${API_KEY}" -s -X POST -H "Content-Type: application/json" --data-binary @request.json```
     >결과<br/>
    {
      "entities": [
         {
          "name": "Robert Galbraith",
          "type": "PERSON",
          "metadata": {
            "mid": "/m/042xh",
            "wikipedia_url": "https://en.wikipedia.org/wiki/J._K._Rowling"
          },
          "salience": 0.7980405,
          "mentions": [
            {
              "text": {
                "content": "Joanne Rowling",
                "beginOffset": 0
              },
              "type": "PROPER"
            },
            {
              "text": {
                "content": "Rowling",
                "beginOffset": 53
              },
              "type": "PROPER"
            },
            {
              "text": {
                "content": "novelist",
                "beginOffset": 96
              },
              "type": "COMMON"
            },
            {
              "text": {
                "content": "Robert Galbraith",
                "beginOffset": 65
              },
              "type": "PROPER"
            }
          ]
        },
        ...
      ]
    }

     * _type_: entity의 종류
     * _salience_: 텍스트에서 entity가 나타난 index를 나타낸다. 이 값은 0과 1 사이에 위치한다.
     * _metions_: NL API는 다른 방법으로 언급된 동일한 entity를 인식할 수 있다.
 
 
 4. Natural Language API로 sentiment 분석하기<br/>
     * request.json을 수정한다.
     >  {
          "document":{
            "type":"PLAIN_TEXT",
            "content":"Harry Potter is the best book. I think everyone should read it."
          },
          "encodingType": "UTF8"
        }
     * _analyzeSentiment_로 API에 request를 보낸다<br/>
        ```curl https://language.googleapis.com/v1/documents:analyzeSentiment?key=${API_KEY}"  -s -X POST -H "Content-Type: application/json" --data-binary @request.json```
     > 결과<br/>
     {
      "documentSentiment": {
        "magnitude": 0.8,
        "score": 0.4
      },
      "language": "en",
      "sentences": [
        {
          "text": {
            "content": "Harry Potter is the best book.",
            "beginOffset": 0
          },
          "sentiment": {
            "magnitude": 0.7,
            "score": 0.7
          }
        },
        {
          "text": {
            "content": "I think everyone should read it.",
            "beginOffset": 31
          },
          "sentiment": {
            "magnitude": 0.1,
            "score": 0.1
          }
        }
      ]
    }
    
   * _score_: -1과 1사이의 숫자로 문장이 긍정적인지 부정적인지 나타낸다.
   * _magnitude_: 양수 값으로 긍정과 부정에 상관없이 문장의 sentiment를 나타낸다.

 
 
 5. entity sentiment 분석하기<br/>
     * _analyzeEntitySentiment_를 이용하여 레스토랑 리뷰 같은 곳에서 어떤 것을 좋아하고 어떤 것을 좋아하지 않는 지 구분할 수 있게 한다
         > I liked the sushi but the service was terrible.
     * request.json
         > {
              "document":{
                "type":"PLAIN_TEXT",
                "content":"I liked the sushi but the service was terrible."
              },
              "encodingType": "UTF8"
            }
            
     * ```curl "https://language.googleapis.com/v1/documents:analyzeEntitySentiment?key=${API_KEY}" -s -X POST -H "Content-Type: application/json" --data-binary @request.json```
     
         > 결과<br/>
         {
      "entities": [
        {
          "name": "sushi",
          "type": "CONSUMER_GOOD",
          "metadata": {},
          "salience": 0.52716845,
          "mentions": [
            {
              "text": {
                "content": "sushi",
                "beginOffset": 12
              },
              "type": "COMMON",
              "sentiment": {
                "magnitude": 0.9,
                "score": 0.9
              }
            }
          ],
          "sentiment": {
            "magnitude": 0.9,
            "score": 0.9
          }
        },
        {
          "name": "service",
          "type": "OTHER",
          "metadata": {},
          "salience": 0.47283158,
          "mentions": [
            {
              "text": {
                "content": "service",
                "beginOffset": 26
              },
              "type": "COMMON",
              "sentiment": {
                "magnitude": 0.9,
                "score": -0.9
              }
            }
          ],
          "sentiment": {
            "magnitude": 0.9,
            "score": -0.9
          }
        }
      ],
      "language": "en"
    }
 
 
 
 6. PoS와 syntax 분석하기<br/>
     * _annotateText_는 발전된 방법입니다. 텍스트의 syntactic elements와 semantic의 디테일을 제공합니다. word의 PoS(명사, 동사, 형용사 등등)을 제공하고 문장에서 다른 단어와 어떤 관련이 있는지 나타내 줍니다.
     * request.json
         > {
              "document":{
                "type":"PLAIN_TEXT",
                "content": "Joanne Rowling is a British novelist, screenwriter and film producer."
              },
              "encodingType": "UTF8"
            }
     * ```curl "https://language.googleapis.com/v1/documents:analyzeSyntax?key=${API_KEY}" \
  -s -X POST -H "Content-Type: application/json" --data-binary @request.json```
          > 결과<br/>
          {
          "text": {
            "content": "is",
            "beginOffset": 15
          },
          "partOfSpeech": {
            "tag": "VERB",
            "aspect": "ASPECT_UNKNOWN",
            "case": "CASE_UNKNOWN",
            "form": "FORM_UNKNOWN",
            "gender": "GENDER_UNKNOWN",
            "mood": "INDICATIVE",
            "number": "SINGULAR",
            "person": "THIRD",
            "proper": "PROPER_UNKNOWN",
            "reciprocity": "RECIPROCITY_UNKNOWN",
            "tense": "PRESENT",
            "voice": "VOICE_UNKNOWN"
          },
          "dependencyEdge": {
            "headTokenIndex": 2,
            "label": "ROOT"
          },
          "lemma": "be"
        },
        
      * _partOfSpeech_: 단어의 품사를 말한다.
      * _dependencyEdge_: 텍트스의 dependency parse tree흫 만들어 사용할 수 있게 한다. 특이 word가 문장에서 각 단어들과 어떤 관계를 가지고 있는지 보여준다. 스스로 이 트리를 생성할 수도 있다.
      * _headTokenIndex_: 그 단어를 가리키고 있는 토큰의 인덱스이다. (tree에서 알 수 있다.)
      * _lemma_: 단어의 canonical 형태이다. (단어의 원래 형태 running->run) 이 값은 text의 큰 조각에서 단어의 occurence를 추적하는데 도움이 된다.

 
 7. 여러 언어로 진행해보기<br/>
     * request.json
         >{
              "document":{
                "type":"PLAIN_TEXT",
                "content":"日本のグーグルのオフィスは、東京の六本木ヒルズにあります"
              }
            }
     * ```curl "https://language.googleapis.com/v1/documents:analyzeEntities?key=${API_KEY}"   -s -X POST -H "Content-Type: application/json" --data-binary @request.json```
     > 결과<br/>
     {
      "entities": [
        {
          "name": "日本",
          "type": "LOCATION",
          "metadata": {
            "mid": "/m/03_3d",
            "wikipedia_url": "https://en.wikipedia.org/wiki/Japan"
          },
          "salience": 0.23854347,
          "mentions": [
            {
              "text": {
                "content": "日本",
                "beginOffset": 0
              },
              "type": "PROPER"
            }
          ]
        },
        {
          "name": "グーグル",
          "type": "ORGANIZATION",
          "metadata": {
            "mid": "/m/045c7b",
            "wikipedia_url": "https://en.wikipedia.org/wiki/Google"
          },
          "salience": 0.21155767,
          "mentions": [
            {
              "text": {
                "content": "グーグル",
                "beginOffset": 9
              },
              "type": "PROPER"
            }
          ]
        },
        ...
      ]
      "language": "ja"
    }
    

 
 
[출처](https://www.qwiklabs.com/focuses/1843?catalog_rank=%7B%22rank%22%3A7%2C%22num_filters%22%3A3%2C%22has_search%22%3Atrue%7D&parent=catalog&search_id=1896403)