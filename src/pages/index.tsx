import { useSession } from "next-auth/react";
import Head from "next/head";
import { CollectionManager } from "~/components/CollectionManager";
import { Hero } from "~/components/Hero";
import { NavBar } from "~/components/NavBar";

export default function Home() {
  const { data } = useSession();
  return (
    <>
      <Head>
        <title>MTG Collection Tracker</title>
      </Head>
      <NavBar />
      {!data && <Hero />}
      {data && <CollectionManager />}
    </>
  );
}
