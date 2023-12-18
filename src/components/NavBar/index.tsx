import type { FC } from "react";
import Link from "next/link";
import { Actions } from "./Actions"

export const NavBar: FC = () => {
  return (
    <nav className="navbar bg-base-100 shadow-xl">
      <div className="flex-1">
        <Link href="/" legacyBehavior>
          <a className="btn btn-ghost text-xl">MTGCollect</a>
        </Link>
      </div>
      <Actions />
    </nav>
  );
};
