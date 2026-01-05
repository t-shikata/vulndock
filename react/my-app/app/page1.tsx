"use client";

import { useState } from "react";

export default function Home() {
  const [posts, setPosts] = useState<string[]>([]);
  const [text, setText] = useState("");

  return (
    <main style={{ padding: 20 }}>
      <h1>社内掲示板</h1>

      <input
        value={text}
        onChange={(e) => setText(e.target.value)}
        placeholder="書き込み"
      />
      <button
        onClick={() => {
          if (!text) return;
          setPosts([...posts, text]);
          setText("");
        }}
      >
        投稿
      </button>

      <ul>
        {posts.map((p, i) => (
          <li key={i}>{p}</li>
        ))}
      </ul>
    </main>
  );
}