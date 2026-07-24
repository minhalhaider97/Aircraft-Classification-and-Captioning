# 📊 Exam Performance Predictor

An end-to-end Machine Learning project that predicts a student's **Math score** based on demographic and academic factors — built with a production-grade, modular pipeline architecture and deployed using Docker.

🔗 **Live Repo:** [Exam-Performance-Predictor](https://github.com/minhalhaider97/Exam-Performance-Predictor)
🐳 **Docker Image:** [`muhammadminhal/exam_performance_app`](https://hub.docker.com/r/muhammadminhal/exam_performance_app)

---

## 📌 Overview

This project takes a student's background details and predicts their **Math score** using a trained regression model. It's built the way a real production ML system would be — not as a single notebook, but as a modular pipeline with clear separation of concerns: data ingestion, data transformation, model training, and prediction, all wired together with proper logging and exception handling.

The final trained model is served through a **Flask** web application with a simple form-based UI, and the entire app is **containerized with Docker** for easy, dependency-free deployment anywhere.

---

## 🧠 Problem Statement

Given a student's:
- Gender
- Race/Ethnicity
- Parental level of education
- Lunch type (standard / free-reduced)
- Test preparation course status (completed / none)
- Reading score
- Writing score

...predict the student's **Math score**.

---

## 📂 Dataset

The dataset (`stud.csv`) contains student records with the following features:

| Column | Description |
|---|---|
| `gender` | Student's gender |
| `race_ethnicity` | Ethnic group category |
| `parental_level_of_education` | Highest education level of parent(s) |
| `lunch` | Type of lunch (standard / free or reduced) |
| `test_preparation_course` | Whether the prep course was completed |
| `reading_score` | Score in reading |
| `writing_score` | Score in writing |
| `math_score` | **Target variable** — score to predict |

---

## ⚙️ Approach

1. **Exploratory Data Analysis (EDA)** — understanding feature distributions and relationships with the target variable (see `notebook/`)
2. **Data Ingestion** — reading raw data and splitting into train/test sets
3. **Data Transformation** — encoding categorical features, scaling numerical features, and building a reusable preprocessing pipeline
4. **Model Training** — training and evaluating multiple regression algorithms with **hyperparameter tuning**
5. **Model Selection** — **Linear Regression** was selected as the best-performing model, achieving an **R² score of 88%** on the test set
6. **Prediction Pipeline** — loading the saved model and preprocessor to serve predictions on new input
7. **Deployment** — wrapped in a Flask web app and containerized with Docker

---

## 🏗️ Project Structure

```
Exam-Performance-Predictor/
│
├── artifacts/                  # Saved model, preprocessor, and train/test data
├── catboost_info/              # Auto-generated CatBoost training logs
├── notebook/
│   ├── data/
│   │   └── stud.csv            # Raw dataset
│   ├── 1. EDA STUDENT PERFORMANCE.ipynb
│   └── 2. MODEL TRAINING.ipynb
│
├── src/
│   ├── components/
│   │   ├── data_ingestion.py       # Reads & splits raw data
│   │   ├── data_transformation.py  # Preprocessing & feature engineering
│   │   └── model_trainer.py        # Trains & evaluates models, saves the best one
│   │
│   ├── pipeline/
│   │   ├── train_pipeline.py       # Orchestrates the full training flow
│   │   └── predict_pipeline.py     # Loads model/preprocessor & serves predictions
│   │
│   ├── exception.py             # Custom exception handling
│   ├── logger.py                # Custom logging configuration
│   └── utils.py                  # Shared helper functions
│
├── templates/                   # HTML templates for the Flask UI
├── app.py                       # Flask application entry point
├── Dockerfile                   # Docker image configuration
├── requirements.txt             # Python dependencies
├── setup.py                     # Package setup
└── README.md
```

---

## 🛠️ Tech Stack

- **Language:** Python
- **ML Library:** scikit-learn
- **Web Framework:** Flask
- **Containerization:** Docker
- **Others:** Pandas, NumPy, CatBoost (evaluated during model selection)

---

## 🚀 Getting Started

### Option 1: Run with Docker (recommended)

No need to install Python or any dependencies — just pull and run the image:

```bash
docker pull muhammadminhal/exam_performance_app:latest
docker run -p 5000:5000 muhammadminhal/exam_performance_app:latest
```

Then open your browser and go to:

```
http://localhost:5000
```

The app opens directly on the prediction page — no extra route needed.

### Option 2: Run Locally

1. Clone the repository
   ```bash
   git clone https://github.com/minhalhaider97/Exam-Performance-Predictor.git
   cd Exam-Performance-Predictor
   ```

2. Create a virtual environment and install dependencies
   ```bash
   python -m venv venv
   venv\Scripts\activate     # On Windows
   source venv/bin/activate  # On Mac/Linux

   pip install -r requirements.txt
   ```

3. Run the Flask app
   ```bash
   python app.py
   ```

4. Open your browser at:
   ```
   http://localhost:5000
   ```

---

## 🖥️ Usage

1. Open the app in your browser.
2. Fill in the student details on the form — gender, ethnicity, parental education, lunch type, test preparation status, reading score, and writing score.
3. Submit the form.
4. The predicted **Math score** is displayed instantly on the page.

---

## 📈 Model Performance

Multiple regression models were trained and hyperparameter-tuned, including Linear Regression, Ridge, Lasso, Decision Tree, Random Forest, and CatBoost. 

**Best Model:** Linear Regression
**R² Score:** **88%**

---

## 🐳 Docker

The application is fully containerized. The Docker image is publicly available on Docker Hub:

```bash
docker pull muhammadminhal/exam_performance_app:latest
```

This makes the project fully portable — it can be deployed on any machine or cloud service that supports Docker, without worrying about Python versions or dependency conflicts.

---

## 🔮 Future Improvements

- Add CI/CD pipeline for automated testing and deployment
- Add model monitoring and logging dashboard
- Experiment tracking with MLflow
- Deploy to a cloud platform (AWS/Azure/Render)

---

## 🙋‍♂️ Author

**Muhammad Minhal**
🔗 [GitHub](https://github.com/minhalhaider97) • 🐳 [Docker Hub](https://hub.docker.com/r/muhammadminhal/exam_performance_app)

---

## ⭐ Support

If you found this project helpful, consider giving it a ⭐ on [GitHub](https://github.com/minhalhaider97/Exam-Performance-Predictor)!
