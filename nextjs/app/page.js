import Image from "next/image";

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <h1>Hello, click <a href="http://127.0.0.1:8000/getdata">this link</a> to see the query.</h1>
    </main>
  );
}
