Google Study Jam
================
# 2. Cloud Natural Language API: Qwik Start

### overview
 * Google Cloud Natural Language API�� ��� text document�� ���� ���, ��α� ����Ʈ ���� ���, ���, �̺�Ʈ �� ���� ������ ������ �� �ְ� �Ѵ�.
 * �̴� �Ҽ� �̵� �޼������̳� �ݼ��Ϳ��� �߻��� �� ��ȭ�κ��� parse intent���� ����� product�� ���� sentiment�� ���� ������ �� �ְ� �Ѵ�.
 * �м��� ���� text document�� ���ε� �� �� �ִ�.
 
### Cloud Natural Language API�� Ư¡
 1. Syntax Analysis: token�� setence�� �����ϰ� PoS(part of speech)�� Ȯ��(�ĺ�)�ϰ�, �� sentence�� dependency parse tree�� �����Ѵ�.
 2. Entity Recognition: entity�� �ĺ��ϰ� ���, ����, ���, �̺�Ʈ, ��ǰ, �̵��� type�� label�� ���δ�.
 3. Sentiment Analysis: text�� ������ ǥ���� ��ü sentiment�� �����ϰ� �Ѵ�.
 4. Content Classification: �̸� ���ǵ� 700�� �̻��� ī�װ��� document�� �����ϰ� �Ѵ�.
 5. Multi-Language: ���� ����� text�� �м��ϱ� ���� �����.
 6. Intergrated REST API: REST API�� ���� ACCESS. �ؽ�Ʈ�� request�� ���ε� �ǰų� Google Cloud Storage�� ���յȴ�.
 
### Lab
 1. API key �����ϱ�(ȯ�溯�� �����ϱ�)
     * PROJECT_ID�� ȯ�溯���� �����Ѵ�.<br/>
     ```export GOOGLE_CLOUD_PROJECT=$(gcloud config get-value core/project)```
     * Natural Language API�� �����ϱ� ���� �� service account�� �����.<br/>
     ```gcloud iam service-accounts create my-natlang-sa --display-name "my natural language service account"```
     * �׷��� credentials(�ڰ�)�� ����� �� service account�� �α��� �Ѵ�. �� credential�� ����� JSON ���Ͽ� �����Ѵ�.<br/>
     ```gcloud iam service-accounts keys create ~/key.json --iam-account my-natlang-sa@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com```
     * ���������� GOOGLE_APPLICATION_CREDENRIALS ȯ�溯���� �����. ȯ�ắ���� ����� ���� credential JSON ������ ��ü ��η� ������ ��� �Ѵ�.<br/>
     ``` export GOOGLE_APPLICATION_CREDENTIALS="/home/USER/key.json" ```
 
 2. Entity Analysis Request�� �����.
     * ���� ���� �������� Natural Language API�� entity analysis�� �õ��� ����.
         > Michelangelo Caravaggio, Italian painter, is known for 'The Calling of Saint Matthew'
     ''' gcloud ml language analyze-entities --content="Michelangelo Caravaggio, Italian painter, is known for 'The Calling of Saint Matthew'."'''
     * ���<br/>
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

 
 
 
 
 > ���忡�� ���, ��� ���� �ܾ ������ ���� ����
 
 
 
 [��ó](https://google.qwiklabs.com/focuses/582?parent=catalog)