// To parse this JSON data, do
//
//     final dashBoardModel = dashBoardModelFromJson(jsonString);

import 'dart:convert';

DashBoardModel dashBoardModelFromJson(String str) =>
    DashBoardModel.fromJson(json.decode(str));

String dashBoardModelToJson(DashBoardModel data) => json.encode(data.toJson());

class DashBoardModel {
  final bool status;
  final DashBoardData data;

  DashBoardModel({
    required this.status,
    required this.data,
  });

  factory DashBoardModel.fromJson(Map<String, dynamic> json) => DashBoardModel(
        status: json["status"],
        data: DashBoardData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class DashBoardData {
  final User user;
  final BankAccount? bankAccount;
  final Currency currency;
  final Loan loan;
  final LoanApplication? loanApplication;
  final String? agreement;

  DashBoardData({
    required this.user,
    required this.bankAccount,
    required this.currency,
    required this.loan,
    required this.loanApplication,
    required this.agreement,
  });

  factory DashBoardData.fromJson(Map<String, dynamic> json) => DashBoardData(
        user: User.fromJson(json["user"]),
        bankAccount: json['bank_account'] == null
            ? null
            : BankAccount.fromJson(json["bank_account"]),
        currency: Currency.fromJson(json["currency"]),
        loan: Loan.fromJson(json["loan"]),
        loanApplication: json['loan_application'] == null
            ? null
            : LoanApplication.fromJson(json["loan_application"]),
        agreement: json["agreement"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "bank_account": bankAccount,
        "currency": currency.toJson(),
        "loan": loan.toJson(),
        "loan_application": loanApplication,
        "agreement": agreement,
      };
}

class BankAccount {
  final String accHolderName;
  final String bankName;
  final String accNumber;
  final String branchName;
  final dynamic verifiedAt;
  final dynamic notes;

  BankAccount({
    required this.accHolderName,
    required this.bankName,
    required this.accNumber,
    required this.branchName,
    required this.verifiedAt,
    required this.notes,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) => BankAccount(
        accHolderName: json["acc_holder_name"],
        bankName: json["bank_name"],
        accNumber: json["acc_number"],
        branchName: json["branch_name"],
        verifiedAt: json["verified_at"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "acc_holder_name": accHolderName,
        "bank_name": bankName,
        "acc_number": accNumber,
        "branch_name": branchName,
        "verified_at": verifiedAt,
        "notes": notes,
      };
}

class Currency {
  final String name;
  final String symbol;

  Currency({
    required this.name,
    required this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Loan {
  final String interestRate;
  final List<int> amounts;
  final List<int> installments;

  Loan({
    required this.interestRate,
    required this.amounts,
    required this.installments,
  });

  factory Loan.fromJson(Map<String, dynamic> json) => Loan(
        interestRate: json["interest_rate"],
        amounts: List<int>.from(json["amounts"].map((x) => x)),
        installments: List<int>.from(json["installments"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "interest_rate": interestRate,
        "amounts": List<dynamic>.from(amounts.map((x) => x)),
        "installments": List<dynamic>.from(installments.map((x) => x)),
      };
}

class LoanApplication {
  final int id;
  final int amount;
  final int installmentAmount;
  final int payableAmount;
  final int installments;
  final int paidInstallments;
  final String interestRate;
  final String status;
  final String createdAt;
  final dynamic loanLevelAmount;
  final dynamic notice;

  LoanApplication({
    required this.id,
    required this.amount,
    required this.installmentAmount,
    required this.payableAmount,
    required this.installments,
    required this.paidInstallments,
    required this.interestRate,
    required this.status,
    required this.createdAt,
    required this.loanLevelAmount,
    required this.notice,
  });

  factory LoanApplication.fromJson(Map<String, dynamic> json) =>
      LoanApplication(
        id: json["id"],
        amount: json["amount"],
        installmentAmount: json["installment_amount"],
        payableAmount: json["payable_amount"],
        installments: json["installments"],
        paidInstallments: json["paid_installments"],
        interestRate: json["interest_rate"],
        status: json["status"],
        createdAt: json["created_at"],
        loanLevelAmount: json["loan_level_amount"],
        notice: json["notice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "installment_amount": installmentAmount,
        "payable_amount": payableAmount,
        "installments": installments,
        "paid_installments": paidInstallments,
        "interest_rate": interestRate,
        "status": status,
        "created_at": createdAt,
        "loan_level_amount": loanLevelAmount,
        "notice": notice,
      };
}

class User {
  final int id;
  final String userId;
  final String name;
  final String phoneCode;
  final String phone;
  final String fullPhone;
  final int loanEligibled;
  final int balance;
  final int loanBalance;
  final String image;
  final String cardNumber;
  final String cardExpiryDate;

  User({
    required this.id,
    required this.userId,
    required this.name,
    required this.phoneCode,
    required this.phone,
    required this.fullPhone,
    required this.loanEligibled,
    required this.balance,
    required this.loanBalance,
    required this.image,
    required this.cardNumber,
    required this.cardExpiryDate,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        phoneCode: json["phone_code"],
        phone: json["phone"],
        fullPhone: json["full_phone"],
        loanEligibled: json["loan_eligibled"],
        balance: json["balance"],
        loanBalance: json["loan_balance"],
        image: json["image"],
        cardNumber: json["card_number"],
        cardExpiryDate: json["card_expiry_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "phone_code": phoneCode,
        "phone": phone,
        "full_phone": fullPhone,
        "loan_eligibled": loanEligibled,
        "balance": balance,
        "loan_balance": loanBalance,
        "image": image,
        "card_number": cardNumber,
        "card_expiry_date": cardExpiryDate,
      };
}
