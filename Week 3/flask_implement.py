from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

# Database configuration
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="comma"
)

# Get all posts
@app.route('/posts', methods=['GET'])
def get_all_posts():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM Posts WHERE status = 'published'")
    posts = cursor.fetchall()
    return render_template('posts.html', posts=posts)

# Insert new post
@app.route('/posts/new', methods=['POST'])
def insert_new_post():
    title = request.form['title']
    summary = request.form['summary']
    content = request.form['content']
    status = 'draft'
    owner_id = 1 
    category_id = 1  

    cursor = db.cursor()
    query = "INSERT INTO Posts (title, summary, content, created_date, updated_date, status, owner_id, category_id) VALUES (%s, %s, %s, NOW(), NOW(), %s, %s, %s)"
    values = (title, summary, content, status, owner_id, category_id)
    cursor.execute(query, values)
    db.commit()

    return "New post inserted successfully"

# Soft delete post
@app.route('/posts/delete/<int:post_id>', methods=['POST'])
def soft_delete_post(post_id):
    cursor = db.cursor()
    query = "UPDATE Posts SET status = 'banned' WHERE id = %s"
    values = (post_id,)
    cursor.execute(query, values)
    db.commit()

    return "Post soft deleted successfully"

if __name__ == '__main__':
    app.run()
