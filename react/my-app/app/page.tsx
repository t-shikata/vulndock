"use client";

import { useEffect, useState } from "react";

type Post = {
  id: number;
  content: string;
};

export default function Home() {
  const [posts, setPosts] = useState<Post[]>([]);
  const [text, setText] = useState("");

  // 初期表示でDBから取得
  useEffect(() => {
    fetch("/api/posts")
      .then((res) => res.json())
      .then((data) => setPosts(data));
  }, []);

  const submit = async () => {
    if (!text) return;

    await fetch("/api/posts", {
      method: "POST",
      body: JSON.stringify({ content: text }),
    });

    setText("");

    // 再取得
    const res = await fetch("/api/posts");
    setPosts(await res.json());
  };

  return (
    <main style={{ padding: 20 }}>
      <h1>社内掲示板</h1>

      <input
        value={text}
        onChange={(e) => setText(e.target.value)}
        placeholder="書き込み"
      />
      <button onClick={submit}>投稿</button>

      <ul>
        {posts.map((p) => (
          <li key={p.id}>{p.content}</li>
        ))}
      </ul>
    </main>
  );
}