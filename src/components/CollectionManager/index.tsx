import type { CardInCollection } from "@prisma/client";
import type { FC } from "react";

export type CollectionManagerProps = {
  collection: CardInCollection[];
};

export const CollectionManager: FC<CollectionManagerProps> = ({
  collection,
}) => {
  return (
    <div className="w-full">
      <h1>My Collection</h1>
    </div>
  );
};
