import { db } from "@/lib/db";

export async function GET() {
  const [rows] = await db.query(
    "SELECT id, content FROM posts ORDER BY id DESC"
  );
  return Response.json(rows);
}

export async function POST(req: Request) {
  const { content } = await req.json();

  await db.query(
    "INSERT INTO posts (content) VALUES (?)",
    [content]
  );

  return Response.json({ ok: true });
}