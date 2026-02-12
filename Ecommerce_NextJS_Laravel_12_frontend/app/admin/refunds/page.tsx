"use client";

import { useEffect, useMemo, useState } from "react";
import { apiUrl, adminToken } from "../../common/http";
import AdminLayout from "../AdminLayout";
import Breadcrumb from "../components/Breadcrumb";
import ResponsiveTable from "../components/ResponsiveTable";

interface PaymentRefund {
  id: number;
  order_id: number;
  payment_method: string;
  payment_gateway?: string | null;
  payment_reference?: string | null;
  amount: number;
  status: string;
  refund_status?: string | null;
  refund_amount?: number | null;
  refunded_at?: string | null;
  created_at?: string;
}

export default function RefundsPage() {
  const [payments, setPayments] = useState<PaymentRefund[]>([]);
  const [loader, setLoader] = useState(false);
  const [search, setSearch] = useState("");

  const fetchRefunds = async () => {
    try {
      setLoader(true);
      const res = await fetch(`${apiUrl}/payments`, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${adminToken()}`,
        },
      });

      const result = await res.json();
      setLoader(false);

      if (result.status === 200 && Array.isArray(result.data)) {
        const refundItems = result.data.filter((item: PaymentRefund) =>
          item.refund_status || item.status === "refunded"
        );
        setPayments(refundItems);
      } else {
        console.error("Unexpected response:", result);
      }
    } catch (error) {
      setLoader(false);
      console.error("Error fetching refunds:", error);
    }
  };

  useEffect(() => {
    fetchRefunds();
  }, []);

  const filteredPayments = useMemo(() => {
    const term = search.toLowerCase();
    if (!term) {
      return payments;
    }

    return payments.filter((payment) => {
      return (
        String(payment.id).includes(term) ||
        String(payment.order_id).includes(term) ||
        (payment.payment_reference || "").toLowerCase().includes(term) ||
        (payment.payment_gateway || "").toLowerCase().includes(term) ||
        (payment.refund_status || "").toLowerCase().includes(term)
      );
    });
  }, [payments, search]);

  return (
    <AdminLayout>
      <div className="p-3 sm:p-4 md:p-6 max-w-7xl mx-auto">
        <Breadcrumb
          items={[
            { label: "Dashboard", href: "/admin" },
            { label: "Refunds" },
          ]}
        />

        <div className="flex flex-col gap-4 mb-6">
          <div>
            <h1 className="text-2xl font-bold text-gray-800">Refunds</h1>
            <p className="text-gray-600 mt-1">Track refund activity</p>
          </div>
          <div className="flex flex-col sm:flex-row gap-3">
            <input
              type="text"
              placeholder="Search refunds..."
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              className="flex-1 border border-gray-300 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>
        </div>

        {loader ? (
          <div className="text-center py-6 text-gray-500">Loading...</div>
        ) : filteredPayments.length > 0 ? (
          <ResponsiveTable<PaymentRefund>
            columns={[
              { key: "id", label: "ID", mobileHide: true },
              { key: "order_id", label: "Order ID" },
              { key: "payment_gateway", label: "Gateway", mobileHide: true },
              { key: "payment_reference", label: "Reference", mobileHide: true },
              { key: "amount", label: "Amount" },
              { key: "refund_amount", label: "Refund Amount" },
              { key: "refund_status", label: "Refund Status" },
              { key: "refunded_at", label: "Refunded At", mobileHide: true },
            ]}
            data={filteredPayments}
            keyField="id"
            loading={loader}
          />
        ) : (
          <div className="text-center py-6 text-gray-500">No refunds found</div>
        )}
      </div>
    </AdminLayout>
  );
}
