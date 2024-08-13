
# Hueharmony

Hueharmony is a Flutter web application designed to colorize black and white images using an advanced machine learning (ML) model. The app integrates with a Flask server to process the images, leveraging cloud storage for seamless image handling.


## Technologies Used
<div style="display: flex; justify-content: space-around; align-items: center;">
  <img src="https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png" alt="Flutter" width="100"/>
  <img src="https://upload.wikimedia.org/wikipedia/commons/3/3c/Flask_logo.svg" alt="Flask" width="100" style="padding: 20px;">
  <img src="https://upload.wikimedia.org/wikipedia/commons/9/96/Pytorch_logo.png" alt="PyTorch" width="100"/>
</div>

## App Demo

![VID_20240813152102-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/e9f4e1b3-ff8c-47bc-aeba-b844c23bc148)

## Features

- **Upload Black and White Images:** Users can upload grayscale images through the web interface.
- **Image Colorization:** The uploaded image is processed using a deep learning model to add vibrant colors.
- **Cloud Storage Integration:** Uploaded images are stored in the cloud, and the Flask server retrieves and processes them.
- **Download Colorized Images:** After processing, users can download the colorized images directly from the app.

## Project Structure

- **Flutter Web App:** The main interface where users interact with the application.
- **Flask Server:** Handles the image processing using a deep learning model, located in the `colorization` folder.
- **Machine Learning Model:** A pre-trained model that adds colors to black and white images, also located in the `colorization` folder.

## Installation

### Prerequisites

Ensure you have the following tools installed:

- [Flutter](https://flutter.dev/) (For building and running the web app)
- [Python 3](https://www.python.org/) (For running the Flask server and ML model)

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-username/hueharmony.git
cd hueharmony
```

### Step 2: Set Up the Flask Server

Navigate to the `colorization` folder:

```bash
cd colorization
```

Install the required Python libraries:

```bash
pip install torch skimage numpy matplotlib argparse PIL
```

### Step 3: Run the Flask Server

Start the Flask server to handle image processing:

```bash
python app.py
```

### Step 4: Run the Flutter Web App

Navigate back to the main project directory and run the Flutter web app:

```bash
flutter run -d chrome
```

## Usage

1. **Upload Image:** Use the upload button to select a black and white image.
2. **Processing:** The image is uploaded to cloud storage, and the link is sent to the Flask server.
3. **Colorization:** The Flask server downloads the image, processes it using the ML model, and re-uploads the colorized image.
4. **Download Image:** The link to the colorized image is provided, allowing you to download the final result.

## Technologies Used

- **Flutter:** For building the responsive web interface.
- **Flask:** For handling backend operations and processing images.
- **Machine Learning (PyTorch):** For colorizing black and white images.

## Contributing

Contributions are welcome! Please create a pull request or open an issue if you have suggestions for improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact Me

You Can contact email me if you have any question : Amr90.vip@gmail.com

---

This README provides a clear overview of the project, instructions for setup and use, and showcases the key technologies used in Hueharmony.
