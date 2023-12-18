import type { FC } from "react"
import { ThemeSwitcher } from "../ThemeSwitcher"
import { Avatar } from "../Avatar"

export const Actions: FC = () => {
  return <div className="flex-none flex gap-2">
    <Avatar />
    <ThemeSwitcher />
  </div>
}