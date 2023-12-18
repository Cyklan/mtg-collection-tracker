import { signIn } from "next-auth/react";
import type { FC } from "react";

export const Hero: FC = () => {
  return (
    <div className="flex w-full flex-col items-center pt-12">
      <h2 className="text-3xl font-bold">Cykis MTG Collection Tracker Tool!</h2>
      <p className="mt-8 text-center">
        In order to use this, please sign in.
        <br />
        Also, this is in very active development, so expect bugs and no mobile
        layout for a while.
        <br />
        Also, I might have to wipe the database at some point, so keep backups
        of your collection using the{" "}
        <span
          className="cursor-help line-through"
          title="There is no export feature yet."
        >
          export feature.
        </span>
      </p>
      <button
        onClick={() => void signIn()}
        className="btn btn-primary mt-8 px-8"
      >
        Sign In
      </button>
    </div>
  );
};
