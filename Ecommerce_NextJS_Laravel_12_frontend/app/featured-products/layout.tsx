"use client";

import Layout from "../components/Layouts";
import { ReactNode } from "react";

export default function FeaturedProductsLayout({
  children,
}: {
  children: ReactNode;
}) {
  return <Layout>{children}</Layout>;
}
