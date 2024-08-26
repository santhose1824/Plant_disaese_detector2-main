from flask import Flask, request, jsonify
import pickle
import random

app = Flask(__name__)

with open("crop_model.pkl","rb") as f:
     crop_model=pickle.load(f)

model_filename = "bot.pkl"
with open(model_filename, 'rb') as model_file:
    bot_model = pickle.load(model_file)

@app.route('/process_data', methods=['POST'])
def process_data():
    data = request.json
    
    # Check if all required fields are present
    if all(key in data for key in ['field1', 'field2', 'field3', 'field4', 'field5', 'field6', 'field7']):
        # Dummy data for testing
        a=data['field1']
        b=data['field2']
        c=data['field3']
        d=data['field4']
        e=data['field5']
        f=data['field6']
        g=data['field7']
        x_test=[[a,b,c,d,e,f,g]]
        # Predict labels for test data
        y_pred = crop_model.predict(x_test)      

        string1 = y_pred[0]
        string2 = 'Some Information'

        if string1 == 'apple':
            image_url = 'https://www.shutterstock.com/image-photo/red-apple-isolated-on-white-600nw-1727544364.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'banana':
            image_url = 'https://www.shutterstock.com/image-photo/banana-cluster-isolated-600nw-575528746.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'blackgram':
            image_url = 'https://www.netmeds.com/images/cms/wysiwyg/blog/2019/09/BlackGram_big_1.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'chickpea':
            image_url = 'https://media.istockphoto.com/id/136239617/photo/chick-peas.jpg?s=612x612&w=0&k=20&c=xVjZGWgL6IsoMZ-QVaTXfluC-DgdcM808c9Rxa8iEY8='
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'coconut':
            image_url = 'https://cdn.pixabay.com/photo/2016/07/06/20/56/coconut-1501334_640.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'coffee':
            image_url = 'https://rukminim2.flixcart.com/image/850/1000/l1dwknk0/plant-sapling/e/l/k/no-perennial-yes-coffee-tree-plant-1-elite-green-original-imagcyaqperggmxh.jpeg?q=20&crop=false'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'cotton':
            image_url = 'https://c8.alamy.com/comp/D29FXK/cotton-crop-in-andhra-pradesh-india-D29FXK.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'grapes':
            image_url = 'https://www.evineyardapp.com/blog/wp-content/uploads/2017/05/wine-berries-694198_1920.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'jute':
            image_url = 'https://t3.ftcdn.net/jpg/05/61/99/80/360_F_561998023_YmOc0Qe3VTK0o5uhJ9eH3BSX49z5dDVl.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'kidneybeans':
            image_url = 'https://thumbs.dreamstime.com/b/kidney-bean-plants-pods-plantation-top-view-speckled-126390168.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'lentil':
            image_url = 'https://cdn.britannica.com/54/148154-050-91F7CB39/Lentil.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'maize':
            image_url = 'https://www.shutterstock.com/image-photo/closeup-corn-on-stalk-field-260nw-478027144.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'mango':
            image_url = 'https://media.istockphoto.com/id/1435602229/photo/close-up-of-red-mangoes.jpg?s=612x612&w=0&k=20&c=a2uO7Ly-irGjtfqZC0ZTt9ps_Sh8S3a6ulf-TMRebao='
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'mothbeans':
            image_url = 'https://www.feedipedia.org/sites/default/files/images/Vigna-aconitifolia_leaves%26flowers-MJussoorie%20Chakrata%20road%20near%20Bharatkhai-1-DSC09876.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'mungbean':
            image_url = 'https://www.shutterstock.com/image-photo/mung-bean-pods-crop-planting-260nw-1072562336.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'muskmelon':
            image_url = 'https://rukminim2.flixcart.com/image/850/1000/xif0q/shopsy-plant-seed/u/2/p/15-ke-355-xolda-original-imaghbqjzcagg243.jpeg?q=90&crop=false'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'orange':
            image_url = 'https://c8.alamy.com/comp/CNR6RA/orange-tree-citrus-sinensis-fruiting-orange-spain-balearen-majorca-CNR6RA.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'papaya':
            image_url = 'https://media.istockphoto.com/id/1472713696/photo/japan-papaya-fruits-under-bright-sun.jpg?s=612x612&w=0&k=20&c=X7TRsOofFSuirmNS3_huihIXoZ8CMowyC0HWNZVTgw0='
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'pigeonpeas':
            image_url = 'https://www.shutterstock.com/image-photo/pigeon-pea-crop-maharashtra-india-260nw-191983859.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'pomegranate':
            image_url = 'https://media.istockphoto.com/id/1351368218/photo/ripe-pomegranates-on-trees-in-the-garden-with-copy-space.jpg?s=612x612&w=0&k=20&c=IRS8btW6ecZCjG_YxD9pPtshzPcapFsdkRNd0ddDvqw='
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'rice':
            image_url = 'https://t4.ftcdn.net/jpg/04/73/73/37/360_F_473733756_rS9ps9Ko6RcIj2j7G5FVLei4NdL9717r.jpg'
            string2 = f'{random.randint(80, 90)}'
        elif string1 == 'watermelon':
            image_url = 'https://media.istockphoto.com/id/177109945/photo/watermelone.jpg?s=612x612&w=0&k=20&c=WbYEDJqi_hhYxjG5nGgNIHi5aJtCQgxz4zqwUC5D_9M='
            string2 = f'{random.randint(80, 90)}'
        else:
            # Default values in case string1 doesn't match any of the specified values
            image_url = 'https://media.istockphoto.com/id/1334790507/vector/3d-vector-floor-house-green-plant-palm-in-white-pot-isolated-on-white-illustration-icon.jpg?s=612x612&w=0&k=20&c=dGsYtSp66z31VWTzpwtlZJCDHvbfieGwDSargtfyTxY='
            string2 = '100'        

        # Return the response
        response = {
            'image_url': image_url,
            'string1': string1,
            'string2': string2
        }
        return jsonify(response), 200
    else:
        return jsonify({'error': 'Invalid data format'}), 400
    
@app.route('/process_message', methods=['POST'])
def process_message():
    data = request.json

    # Check if the message field is present in the request data
    if 'message' in data:
        user_message = data['message']
        
        # Perform some logic to generate the bot's response based on the user's message
        # For simplicity, let's echo back the user's message as the bot's response
        
        predicted_response = bot_model.predict([user_message])

        bot_response = predicted_response[0]
        
        # Return the bot's response
        response = {
            'response': bot_response
        }
        return jsonify(response), 200
    else:
        # If the message field is not present, return an error response
        return jsonify({'error': 'Message field missing'}), 400

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
