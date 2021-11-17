package entily;


import java.util.Date;

public class InsertData {	
	public static void main(String[] args) {
// QUESTION 2:
		// create department
		Department department1 = new Department();
		department1.departmentID = 1;
		department1.departmentName = "Sale" ;
		
		Department department2 = new Department();
		department2.departmentID = 2;
		department2.departmentName = "Marketting" ;
		
		Department department3 = new Department();
		department3.departmentID = 3;
		department3.departmentName = "IT" ;
		
		// create Position
		Position position1 = new Position();
		position1.positionID = 1 ;
		position1.positionName = "Dev" ;
		
		Position position2 = new Position();
		position2.positionID = 2 ;
		position2.positionName = "Test" ;
		
		Position position3 = new Position();
		position3.positionID = 3 ;
		position3.positionName = "Scrum Master" ;
		
		Position position4 = new Position();
		position4.positionID = 4 ;
		position4.positionName = "PM" ;
		
		// create account
		Account account1 = new Account();
		account1.accountID = 1 ;
		account1.fullName = " Tran Van An" ;
		account1.userName = "AnPro2020 " ;
		account1.email = "sddgsdgsgd@gmail.com" ;
		account1.position = position1 ;
		account1.department = department2 ;
		account1.createDate = new Date(2019-12-26) ;
		
		Account account2 = new Account();
		account2.accountID = 2 ;
		account2.fullName = " Le Van Binh" ;
		account2.userName = "BinhPro2020 " ;
		account2.email = "sddgsfbgfngsgd@gmail.com" ;
		account2.position = position1 ;
		account2.department = department2 ;
		account2.createDate = new Date(2019-12-26) ; 
		
		Account account3 = new Account();
		account3.accountID = 3 ;
		account3.fullName = " Nguyen Van Chinh" ;
		account3.userName = "ChinhPro2020 " ;
		account3.email = "sddgsikid@gmail.com" ;
		account3.position = position1 ;
		account3.department = department2 ;
		account3.createDate = new Date(2019-12-26) ; 
		
		// create Group
		Group group1 = new Group();
		group1.groupID = 1;
		group1.groupName = "Shopping";
		group1.creatorID = account1;
		group1.createDate = new Date(2019-12-26)  ;
		group1.accountNumber = 3 ;
		
		Group group2 = new Group();
		group2.groupID = 2;
		group2.groupName = "Foolball";
		group2.creatorID = account1;
		group2.createDate = new Date(2019-12-26) ;
		
		Group group3 = new Group();
		group3.groupID = 3;
		group3.groupName = "Foolball";
		group3.creatorID = account2;
		group3.createDate = new Date(2019-12-26) ;
		
		// create GroupAccount
		GroupAccount ga1 = new GroupAccount();
		ga1.group = group1;
		Account[] ac1 = {account1,account2};
		ga1.accounts = ac1;
		ga1.joinDate = new Date(2019-12-26);
		
		GroupAccount ga2 = new GroupAccount();
		ga2.group = group1;
		Account[] ac2 = {account1,account3};
		ga2.accounts = ac2;
		ga2.joinDate = new Date(2019-12-26);
		
		GroupAccount ga3 = new GroupAccount();
		ga3.group = group3;
		Account[] ac3 = {account1,account2,account3};
		ga3.accounts = ac3;
		ga3.joinDate = new Date(2019-12-26);
	
		
		// create TypeQuestion
		TypeQuestion type1 = new TypeQuestion();
		type1.typeID = 1;
		type1.typeName = Type.ESSAY ;
		
		TypeQuestion type2 = new TypeQuestion();
		type2.typeID = 3;
		type2.typeName = Type.MULTIPLE_CHOICE ;
		
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
		qest1.createDate = new Date(2020-10-15);
		
		Question qest2 = new Question();
		qest2.questionID = 2;
		qest2.category = cate1;
		qest2.content = "SQL la gi";
		qest2.creatorID = account2;
		qest2.type = type1;
		qest2.createDate = new Date(2020-10-15);
		
		Question qest3 = new Question();
		qest3.questionID = 3;
		qest3.category = cate1;
		qest3.content = "Ruby la gi";
		qest3.creatorID = account3;
		qest3.type = type2;
		qest3.createDate = new Date(2020-11-15);
		
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
		e1.code="Java1";
		e1.createDate = new Date(2021-05-05);
		e1.creatorID = account1;
		e1.duration = 60;
		e1.examID = 1;
		
		Exam e2 = new Exam();
		e2.category = cate2;
		e2.code="SQL1";
		e2.createDate = new Date(2021-05-05);
		e2.creatorID = account3;
		e2.duration = 60;
		e2.examID = 2;
		
		Exam e3 = new Exam();
		e3.category = cate3;
		e3.code="Ruby1";
		e3.createDate = new Date(2021-05-05);
		e3.creatorID = account2;
		e3.duration = 60;
		e3.examID = 3;
		
		// create ExamQuestion
		ExamQuestion eq1 = new ExamQuestion();
		eq1.exam = e1;
		Question[]	questions1 = {qest1,qest2,qest3};
		eq1.questions = questions1;
		
		ExamQuestion eq2 = new ExamQuestion();
		eq2.exam = e2;
		Question[]	questions2 = {qest1,qest3};
		eq2.questions = questions2;
		
		ExamQuestion eq3 = new ExamQuestion();
		eq3.exam = e3;
		Question[]	questions3 = {qest2,qest3};
		eq3.questions = questions3;
		
			
	}			
}


