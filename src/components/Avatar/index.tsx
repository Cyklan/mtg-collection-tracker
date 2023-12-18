import type { FC } from "react";
import { signIn, signOut, useSession } from "next-auth/react";
import type { Session } from "next-auth";
import { IconUser } from "@tabler/icons-react";

export const Avatar: FC = () => {
  const { data } = useSession();

  if (!data) return <LoggedOutAvatar />;

  return <LoggedInAvatar session={data} />;
};

export const LoggedOutAvatar: FC = () => {
  return (
    <div className="avatar placeholder">
      <div className="w-12 cursor-pointer rounded-full">
        <button onClick={() => void signIn()}>
          <IconUser className="h-8 w-8" />
        </button>
      </div>
    </div>
  );
};

export const LoggedInAvatar: FC<{ session: Session }> = ({ session }) => {
  return (
    <div className="avatar placeholder">
      <div className="bg-neutral text-neutral-content w-10 cursor-pointer rounded-full text-xl uppercase">
        <button className="w-full h-full" onClick={() => void signOut()}>{session.user.name?.charAt(0)}</button>
      </div>
    </div>
  );
};
