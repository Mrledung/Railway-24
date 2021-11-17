package entily;

import java.util.Date;

public class FlowControl {
	public static void main(String[] args) {

		// create department
		Department department1 = new Department();
		department1.departmentID = 1;
		department1.departmentName = "Sale";

		Department department2 = new Department();
		department2.departmentID = 2;
		department2.departmentName = "Marketting";

		Department department3 = new Department();
		department3.departmentID = 3;
		department3.departmentName = "IT";

		// create Position
		Position position1 = new Position();
		position1.positionID = 1;
		position1.positionName = "Dev";

		Position position2 = new Position();
		position2.positionID = 2;
		position2.positionName = "Test";

		Position position3 = new Position();
		position3.positionID = 3;
		position3.positionName = "Scrum Master";

		Position position4 = new Position();
		position4.positionID = 4;
		position4.positionName = "PM";

		// create account
		Account account1 = new Account();
		account1.accountID = 1;
		account1.fullName = " Tran Van An";
		account1.userName = "AnPro2020 ";
		account1.email = "sddgsdgsgd@gmail.com";
		account1.position = position1;
		account1.department = department2;
		account1.createDate = new Date(2019 - 12 - 26);

		Account account2 = new Account();
		account2.accountID = 2;
		account2.fullName = " Le Van Binh";
		account2.userName = "BinhPro2020 ";
		account2.email = "sddgsfbgfngsgd@gmail.com";
		account2.position = position1;
		account2.department = department2;
		account2.createDate = new Date(2019 - 12 - 26);

		Account account3 = new Account();
		account3.accountID = 3;
		account3.fullName = " Nguyen Van Chinh";
		account3.userName = "ChinhPro2020 ";
		account3.email = "sddgsikid@gmail.com";
		account3.position = position1;
		account3.department = department2;
		account3.createDate = new Date(2019 - 12 - 26);

		Account[] departmentOfAccount1 = { account1, account2 };
		department1.accounts = departmentOfAccount1;

		Account[] departmentOfAccount2 = { account1, account3 };
		department2.accounts = departmentOfAccount2;

		Account[] departmentOfAccount3 = { account1, account2, account3 };
		department3.accounts = departmentOfAccount3;

		// create Group
		Group group1 = new Group();
		group1.groupID = 1;
		group1.groupName = "Shopping";
		group1.creatorID = account1;
		group1.createDate = new Date(2019 - 12 - 26);
		group1.accountNumber = 3;

		Group group2 = new Group();
		group2.groupID = 2;
		group2.groupName = "Foolball";
		group2.creatorID = account1;
		group2.createDate = new Date(2019 - 12 - 26);

		Group group3 = new Group();
		group3.groupID = 3;
		group3.groupName = "Foolball";
		group3.creatorID = account2;
		group3.createDate = new Date(2019 - 12 - 26);

		Group[] groupofaccount1 = { group1, group2 };
		account1.groups = groupofaccount1;

		Group[] groupofaccount2 = { group1, group3, group2 };
		account2.groups = groupofaccount2;

		Group[] groupofaccount3 = { group1, group2 };
		account3.groups = groupofaccount3;

		Account[] ac1 = { account1, account2 };
		group1.accounts = ac1;

		Account[] ac2 = { account1, account3 };
		group2.accounts = ac2;

		Account[] ac3 = { account1, account2, account3 };
		group3.accounts = ac3;

		// create GroupAccount
		GroupAccount ga1 = new GroupAccount();
		ga1.group = group1;
		ga1.joinDate = new Date(2019 - 12 - 26);

		GroupAccount ga2 = new GroupAccount();
		ga2.group = group1;
		ga2.joinDate = new Date(2019 - 12 - 26);

		GroupAccount ga3 = new GroupAccount();
		ga3.group = group3;
		ga3.joinDate = new Date(2019 - 12 - 26);

		// create TypeQuestion
		TypeQuestion type1 = new TypeQuestion();
		type1.typeID = 1;
		type1.typeName = Type.ESSAY;

		TypeQuestion type2 = new TypeQuestion();
		type2.typeID = 3;
		type2.typeName = Type.MULTIPLE_CHOICE;

		// create CategoryQuestion
		CategoryQuestion cate1 = new CategoryQuestion();
		cate1.categoryID = 1;
		cate1.categoryName = "cau hoi ve java";

		CategoryQuestion cate2 = new CategoryQuestion();
		cate2.categoryID = 2;
		cate2.categoryName = "cau hoi ve SQL";

		CategoryQuestion cate3 = new CategoryQuestion();
		cate3.categoryID = 3;
		cate3.categoryName = "cau hoi ve Ruby";

		// create Question
		Question qest1 = new Question();
		qest1.questionID = 1;
		qest1.category = cate1;
		qest1.content = "Java la gi";
		qest1.creatorID = account1;
		qest1.type = type1;
		qest1.createDate = new Date(2020 - 10 - 15);

		Question qest2 = new Question();
		qest2.questionID = 2;
		qest2.category = cate1;
		qest2.content = "SQL la gi";
		qest2.creatorID = account2;
		qest2.type = type1;
		qest2.createDate = new Date(2020 - 10 - 15);

		Question qest3 = new Question();
		qest3.questionID = 3;
		qest3.category = cate1;
		qest3.content = "Ruby la gi";
		qest3.creatorID = account3;
		qest3.type = type2;
		qest3.createDate = new Date(2020 - 11 - 15);

		// create Answer
		Answer a1 = new Answer();
		a1.answerID = 1;
		a1.content = "Java la nn lap trinh";
		a1.question = qest1;

		Answer a2 = new Answer();
		a2.answerID = 2;
		a2.content = "SQL la nn lap trinh";
		a2.question = qest2;

		Answer a3 = new Answer();
		a3.answerID = 3;
		a3.content = "Ruby la nn lap trinh";
		a3.question = qest3;

		// create Exam
		Exam e1 = new Exam();
		e1.category = cate1;
		e1.code = "Java1";
		e1.createDate = new Date(2021 - 05 - 05);
		e1.creatorID = account1;
		e1.duration = 60;
		e1.examID = 1;

		Exam e2 = new Exam();
		e2.category = cate2;
		e2.code = "SQL1";
		e2.createDate = new Date(2021 - 05 - 05);
		e2.creatorID = account3;
		e2.duration = 60;
		e2.examID = 2;

		Exam e3 = new Exam();
		e3.category = cate3;
		e3.code = "Ruby1";
		e3.createDate = new Date(2021 - 05 - 05);
		e3.creatorID = account2;
		e3.duration = 60;
		e3.examID = 3;

		// create ExamQuestion
		ExamQuestion eq1 = new ExamQuestion();
		eq1.exam = e1;
		Question[] questions1 = { qest1, qest2, qest3 };
		eq1.questions = questions1;

		ExamQuestion eq2 = new ExamQuestion();
		eq2.exam = e2;
		Question[] questions2 = { qest1, qest3 };
		eq2.questions = questions2;

		ExamQuestion eq3 = new ExamQuestion();
		eq3.exam = e3;
		Question[] questions3 = { qest2, qest3 };
		eq3.questions = questions3;

// Question 1 (if else)
		System.out.println(" Question 1: in Phòng ban của account 2 (if else) :");
		if (account2.department == null) {
			System.out.println("Nhân viên này chưa có phòng ban");
		} else {
			System.out.println("Phòng ban của nhân viên này là : " + account2.department.departmentName);
		}
		System.out.println("\n");

// Question 2 (if else)
		System.out.println(" Question 2: account 2 tham gia bao nhiêu group & title :");
		if (account2.groups.length == 0) {
			System.out.println("Nhân vien này chưa có group");
		} else if (account2.groups.length == 1 || account2.groups.length == 2) {
			System.out.println("group của nhân viên này là Shopping,Foolball");
		} else if (account2.groups.length == 3) {
			System.out.println("Nhân viên này là người quan trọng , tham gia nhiều group");
		} else {
			System.out.println("Nhân viên này là người hóng chuyện , tham gia tất cả các group");
		}
		System.out.println("\n");

// Question 3 (sd ternary)	
		System.out.println(" Question 3: in Phòng ban của account 2 :");
		System.out.println(account2.department == null ? "Nhân viên này chưa có phòng ban"
				: "Phòng ban của nhân viên này là : " + account2.department.departmentName);
		System.out.println("\n");

// Question 4 (sd ternary)
		System.out.println(" Question 4: in chức vụ của account 1 :");
		System.out.println(
				account1.position.positionName == "Dev" ? "Đây là Developer" : "Người này không phải là Developer");
		System.out.println("\n");

// SWITCH CASE
// Question 5:
		System.out.println(" Question 5: số thành viên của nhóm 1 :");
		int accountsInGroup = group1.accounts.length;
		switch (accountsInGroup) {
		case 1:
			System.out.println("Nhóm có một thành viên");
			break;
		case 2:
			System.out.println("Nhóm có hai thành viên");
			break;
		case 3:
			System.out.println("Nhóm có ba thành viên");
			break;
		default:
			System.out.println("Nhóm có nhiều thành viên");
			break;
		}
		System.out.println("\n");

//Question 6:
		System.out.println(" Question 6: account 2 tham gia bao nhiêu group & title (switch case):");
		int groupsOfAccount2 = account2.groups.length;
		switch (groupsOfAccount2) {
		case 0:
			System.out.println("Nhân vien này chưa có group");
			break;
		case 1:
			System.out.println("group của nhân viên này là Shopping,Foolball");
			break;
		case 2:
			System.out.println("group của nhân viên này là Shopping,Foolball");
			break;
		case 3:
			System.out.println("Nhân viên này là người quan trọng , tham gia nhiều group");
			break;
		default:
			System.out.println("Nhân viên này là người hóng chuyện , tham gia tất cả các group");
			break;
		}
		System.out.println("\n");

// Question 7
		System.out.println(" Question 7: in chức vụ của account 1 (switch case):");
		String account1OfPosition = account1.position.positionName;
		switch (account1OfPosition) {
		case "Dev":
			System.out.println("Đây là Developer");
			break;
		default:
			System.out.println("Người này không phải là Developer");
			break;
		}
		System.out.println("\n");

// FOREACH 
// Question 8: In ra thông tin các account bao gồm: Email, FullName và tên phòng ban của họ

		System.out.println(" Question 8: In ra thông tin các account :");
		Account[] accountArrays = { account1, account2, account3 };
		for (Account account : accountArrays) {
			System.out.println("*ID: " + account.accountID + " *FullName: " + account.fullName + " Email: "
					+ account.fullName + " *Tên phòng ban: " + account.department.departmentName);
		}
		System.out.println("\n");

// Question 9:In ra thông tin các phòng ban bao gồm: id và name
		System.out.println(" Question 9: In ra thông tin các phòng ban :");
		Department[] departmentArrays = { department1, department2 };
		for (Department department : departmentArrays) {
			System.out.println("ID: " + department.departmentID + " *Name: " + department.departmentName);
		}
		System.out.println("\n");

//FOR
// Question 10
		System.out.println(" Question 10: In ra thông tin account theo định dạng  :");
		Account[] accArrays = { account1, account2, account3 };
		for (int i = 0; i < accArrays.length; i++) {
			System.out.println("  Thông tin account thứ " + (i + 1) + " là :");
			System.out.println("Email: " + accArrays[i].email);
			System.out.println("Full name: " + accArrays[i].fullName);
			System.out.println("Phòng ban: " + accArrays[i].department.departmentName);
		}
		System.out.println("\n");

//Question 11:In ra thông tin các phòng ban bao gồm: id và name theo định dạng
		System.out.println(" Question 11: In ra thông tin phòng ban theo định dạng  :");
		Department[] deprtArrays = { department1, department2, department3 };
		for (int i = 0; i < deprtArrays.length; i++) {
			System.out.println("  Thông tin department thứ " + (i + 1) + " là :");
			System.out.println("Id: " + deprtArrays[i].departmentID);
			System.out.println("Name: " + deprtArrays[i].departmentName);
		}
		System.out.println("\n");

//Question 12:Chỉ in ra thông tin 2 department đầu tiên theo định dạng như Question 10
		System.out.println(" Question 11: In ra thông tin phòng ban theo định dạng  :");
		Department[] deprtArrays1 = { department1, department2 };
		for (int i = 0; i < 2; i++) {
			System.out.println("  Thông tin department thứ " + (i + 1) + " là :");
			System.out.println("Id: " + deprtArrays1[i].departmentID);
			System.out.println("Name: " + deprtArrays1[i].departmentName);
		}
		System.out.println("\n");

// Question 13:In ra thông tin tất cả các account ngoại trừ account thứ 2
		System.out.println(" Question 13: In ra thông tin account  :");
		Account[] accArrays1 = { account1, account2, account3 };
		for (int i = 0; i < accArrays1.length; i++) {
			if (i != 1) { // dieu kien tao buoc nhay
				System.out.println("  Thông tin account thứ " + (i + 1) + " là :");
				System.out.println("Email: " + accArrays1[i].email);
				System.out.println("Full name: " + accArrays1[i].fullName);
				System.out.println("Phòng ban: " + accArrays1[i].department.departmentName);
			}
		}
		System.out.println("\n");

//Question 14:In ra thông tin tất cả các account có id < 4
		System.out.println(" Question 14: In ra thông tin account  :");
		Account[] accArrays12 = { account1, account2, account3 };
		for (int i = 0; i < accArrays12.length; i++) {
			if (accArrays12[1].accountID < 4) { // dieu kien tao buoc nhay
				System.out.println("  Thông tin account thứ " + (i + 1) + " là :");
				System.out.println("Email: " + accArrays12[i].email);
				System.out.println("Full name: " + accArrays12[i].fullName);
				System.out.println("Phòng ban: " + accArrays12[i].department.departmentName);
			}
		}
		System.out.println("\n");

//Question 15:In ra các số chẵn nhỏ hơn hoặc bằng 20
		System.out.println(" Question 15: các số chẵn nhỏ hơn hoặc bằng 20  :");
		for (int i = 1; i < 20; i++) {
			System.out.print((i += 1) + " ");
		}
		System.out.println("\n");
// cach trong huong dan
//		for (int i = 1; i <= 20; i++) {
//			if (i%2 ==0 ) {
//			System.out.print(i+ " ");
//			}
//			}

//WHILE
		/*
		 * Question 16: Làm lại các Question ở phần FOR bằng cách sử dụng WHILE kết hợp
		 * với lệnh break, continue
		 */
		// Q10
		System.out.println(" Question 16_10: In ra thông tin account theo định dạng (sd while) :");
		Account[] accArrays16 = { account1, account2, account3 };
		int i = 0;
		while (i < accArrays16.length) {
			System.out.println("  Thông tin account thứ " + (i + 1) + " là :");
			System.out.println("Email: " + accArrays[i].email);
			System.out.println("Full name: " + accArrays[i].fullName);
			System.out.println("Phòng ban: " + accArrays[i].department.departmentName);
			i++;
		}
		System.out.println("\n");

		// Q11
		System.out.println(" Question 16_11: In ra thông tin phòng ban theo định dạng  :");
		Department[] dep16 = { department1, department2, department3 };
		int k = 0;
		while (k < dep16.length) {
			System.out.println("  Thông tin department thứ " + (k + 1) + " là :");
			System.out.println("Id: " + dep16[k].departmentID);
			System.out.println("Name: " + dep16[k].departmentName);
			k++;
		}
		System.out.println("\n");

		// Q12

		System.out.println(" Question 16_12: In ra thông tin phòng ban 1,2 theo định dạng  :");
		Department[] deprtArrays15 = { department1, department2, department3 };
		int g = 0;
		while (g < deprtArrays15.length) {
			if (g == 2) {
				break;
			}
			System.out.println("  Thông tin department thứ " + (g + 1) + " là :");
			System.out.println("Id: " + deprtArrays15[g].departmentID);
			System.out.println("Name: " + deprtArrays15[g].departmentName);
			g++;
		}
		System.out.println("\n");

		// Q13

		System.out.println(" Question 16_13: In ra thông tin account -account2  :");
		Account[] acc16 = { account1, account2, account3 };
		int j = 0;
		while (j < acc16.length) {
			if (j != 1) {
				System.out.println("  Thông tin account thứ " + (j + 1) + " là :");
				System.out.println("Email: " + acc16[j].email);
				System.out.println("Full name: " + acc16[j].fullName);
				System.out.println("Phòng ban: " + acc16[j].department.departmentName);
			}
			j++;
		}
		System.out.println("\n");

		// Q14
		System.out.println(" Question 16_14: In ra thông tin account ID<4 :");
		Account[] acc12 = { account1, account2, account3 };
		int b = 0;
		while (b < accArrays12.length) {
			if (acc12[1].accountID < 4) {
				System.out.println("  Thông tin account thứ " + (b + 1) + " là :");
				System.out.println("Email: " + acc12[b].email);
				System.out.println("Full name: " + acc12[b].fullName);
				System.out.println("Phòng ban: " + acc12[b].department.departmentName);
			}
			b++;
		}
		System.out.println("\n");

		// Q15

		System.out.println(" Question 16_15: các số chẵn nhỏ hơn hoặc bằng 20  :");
		int h = 1;
		while (h < 20) {

			System.out.print((h += 1) + " ");
		}
		h++;
		System.out.println("\n");

//DO-WHILE
//		Question 17:Làm lại các Question ở phần FOR bằng cách sử dụng DO-WHILE kết hợp với lệnh break, continue	

		// Q10
		System.out.println(" Question 17_10: In ra thông tin account theo định dạng (sd while) :");
		Account[] accArrays163 = { account1, account2, account3 };
		int i3 = 0;
		do {
			System.out.println("  Thông tin account thứ " + (i3 + 1) + " là :");
			System.out.println("Email: " + accArrays163[i3].email);
			System.out.println("Full name: " + accArrays163[i3].fullName);
			System.out.println("Phòng ban: " + accArrays163[i3].department.departmentName);
			i3++;
		} while (i3 < accArrays163.length);
		System.out.println("\n");

		// Q11
		System.out.println(" Question 16_11: In ra thông tin phòng ban theo định dạng  :");
		Department[] dep163 = { department1, department2, department3 };
		int k3 = 0;
		do {
			System.out.println("  Thông tin department thứ " + (k3 + 1) + " là :");
			System.out.println("Id: " + dep163[k].departmentID);
			System.out.println("Name: " + dep163[k].departmentName);
			k3++;
		} while (k3 < dep163.length);
		System.out.println("\n");

		// Q12

		System.out.println(" Question 17_12: In ra thông tin phòng ban 1,2 theo định dạng  :");
		Department[] deprtArrays153 = { department1, department2, department3 };
		int g3 = 0;
		do {
			if (g == 2) {
				break;
			}
			System.out.println("  Thông tin department thứ " + (g3 + 1) + " là :");
			System.out.println("Id: " + deprtArrays153[g3].departmentID);
			System.out.println("Name: " + deprtArrays153[g3].departmentName);
			g3++;
		} while (g3 < deprtArrays153.length);
		System.out.println("\n");

		// Q13

		System.out.println(" Question 17_13: In ra thông tin account -account2  :");
		Account[] acc163 = { account1, account2, account3 };
		int j3 = 0;
		do {
			if (j3 != 1) {
				System.out.println("  Thông tin account thứ " + (j3 + 1) + " là :");
				System.out.println("Email: " + acc163[j3].email);
				System.out.println("Full name: " + acc163[j3].fullName);
				System.out.println("Phòng ban: " + acc163[j3].department.departmentName);
			}
			j3++;
		} while (j3 < acc163.length);
		System.out.println("\n");

		// Q14
		System.out.println(" Question 16_14: In ra thông tin account ID<4 :");
		Account[] acc123 = { account1, account2, account3 };
		int b3 = 0;
		do {
			if (acc12[1].accountID < 4) {
				System.out.println("  Thông tin account thứ " + (b3 + 1) + " là :");
				System.out.println("Email: " + acc123[b3].email);
				System.out.println("Full name: " + acc123[b3].fullName);
				System.out.println("Phòng ban: " + acc123[b3].department.departmentName);
			}
			b3++;
		} while (b3 < acc123.length);
		System.out.println("\n");

		// Q15

		System.out.println(" Question 16_15: các số chẵn nhỏ hơn hoặc bằng 20  :");
		int h3 = 1;
		do {
			System.out.print((h3 += 1) + " ");
			h3++;
		} while (h3 < 20);
		System.out.println("\n");

	}
}
