%loading data
Load_Train_Data;
Load_Test_Data;

%Method_A_Train_Input 
% intensity
A01=mean([mean(E0(1:2,2:9))]);
A02=mean([mean(E0(8:9,2:9))]);
A03=mean([mean(E0(19:20,2:9))]);
A04=mean([mean(E0(2:9,1:3))]);
A05=mean([mean(E0(2:9,7:10))]);
A06=mean([mean(E0(11:19,2:9))]);
A07=mean([mean(E0(11:19,7:10))]);

A11=mean([mean(E1(1:2,2:9))]);
A12=mean([mean(E1(8:9,2:9))]);
A13=mean([mean(E1(19:20,2:9))]);
A14=mean([mean(E1(2:9,1:3))]);
A15=mean([mean(E1(2:9,7:10))]);
A16=mean([mean(E1(11:19,2:9))]);
A17=mean([mean(E1(11:19,7:10))]);

A21=mean([mean(E2(1:2,2:9))]);
A22=mean([mean(E2(8:9,2:9))]);
A23=mean([mean(E2(19:20,2:9))]);
A24=mean([mean(E1(2:9,1:3))]);
A25=mean([mean(E2(2:9,7:10))]);
A26=mean([mean(E2(11:19,2:9))]);
A27=mean([mean(E2(11:19,7:10))]);

A31=mean([mean(E3(1:2,2:9))]);
A32=mean([mean(E3(8:9,2:9))]);
A33=mean([mean(E3(19:20,2:9))]);
A34=mean([mean(E3(2:9,1:3))]);
A35=mean([mean(E3(2:9,7:10))]);
A36=mean([mean(E3(11:19,2:9))]);
A37=mean([mean(E3(11:19,7:10))]);

A41=mean([mean(E4(1:2,2:9))]);
A42=mean([mean(E4(8:9,2:9))]);
A43=mean([mean(E4(19:20,2:9))]);
A44=mean([mean(E4(2:9,1:3))]);
A45=mean([mean(E4(2:9,7:10))]);
A46=mean([mean(E4(11:19,2:9))]);
A47=mean([mean(E4(11:19,7:10))]);

A51=mean([mean(E5(1:2,2:9))]);
A52=mean([mean(E5(8:9,2:9))]);
A53=mean([mean(E5(19:20,2:9))]);
A54=mean([mean(E5(2:9,1:3))]);
A55=mean([mean(E4(2:9,7:10))]);
A56=mean([mean(E5(11:19,2:9))]);
A57=mean([mean(E5(11:19,7:10))]);

A61=mean([mean(E6(1:2,2:9))]);
A62=mean([mean(E6(8:9,2:9))]);
A63=mean([mean(E6(19:20,2:9))]);
A64=mean([mean(E6(2:9,1:3))]);
A65=mean([mean(E6(2:9,7:10))]);
A66=mean([mean(E6(11:19,2:9))]);
A67=mean([mean(E6(11:19,7:10))]);

A71=mean([mean(E7(1:2,2:9))]);
A72=mean([mean(E7(8:9,2:9))]);
A73=mean([mean(E7(19:20,2:9))]);
A74=mean([mean(E7(2:9,1:3))]);
A75=mean([mean(E7(2:9,7:10))]);
A76=mean([mean(E7(11:19,2:9))]);
A77=mean([mean(E7(11:19,7:10))]);

A81=mean([mean(E8(1:2,2:9))]);
A82=mean([mean(E8(8:9,2:9))]);
A83=mean([mean(E8(19:20,2:9))]);
A84=mean([mean(E8(2:9,1:3))]);
A85=mean([mean(E8(2:9,7:10))]);
A86=mean([mean(E8(11:19,2:9))]);
A87=mean([mean(E8(11:19,7:10))]);

A91=mean([mean(E9(1:2,2:9))]);
A92=mean([mean(E9(8:9,2:9))]);
A93=mean([mean(E9(19:20,2:9))]);
A94=mean([mean(E9(2:9,1:3))]);
A95=mean([mean(E9(2:9,7:10))]);
A96=mean([mean(E9(11:19,2:9))]);
A97=mean([mean(E9(11:19,7:10))]);

%Input matrix
Input_Train_Method_A = [A01 A02 A03 A04 A05 A06 A07;
    A11 A12 A13 A14 A15 A16 A17;
    A21 A22 A23 A24 A25 A26 A27;
    A31 A32 A33 A34 A35 A36 A37;
    A41 A42 A43 A44 A45 A46 A47;
    A51 A52 A53 A54 A55 A56 A57;
    A61 A62 A63 A64 A65 A66 A67;
    A71 A72 A73 A74 A75 A76 A77;
    A81 A82 A83 A84 A85 A86 A87;
    A91 A92 A93 A94 A95 A96 A97;
    ];


%Method_C_Test_Input_1
% intensity
A01Vn=mean([mean(E0Vn(1:2,2:9))]);
A02Vn=mean([mean(E0Vn(8:9,2:9))]);
A03Vn=mean([mean(E0Vn(19:20,2:9))]);
A04Vn=mean([mean(E0Vn(2:9,1:3))]);
A05Vn=mean([mean(E0Vn(2:9,7:10))]);
A06Vn=mean([mean(E0Vn(11:19,2:9))]);
A07Vn=mean([mean(E0Vn(11:19,7:10))]);

A11Vn=mean([mean(E1Vn(1:2,2:9))]);
A12Vn=mean([mean(E1Vn(8:9,2:9))]);
A13Vn=mean([mean(E1Vn(19:20,2:9))]);
A14Vn=mean([mean(E1Vn(2:9,1:3))]);
A15Vn=mean([mean(E1Vn(2:9,7:10))]);
A16Vn=mean([mean(E1Vn(11:19,2:9))]);
A17Vn=mean([mean(E1Vn(11:19,7:10))]);

A21Vn=mean([mean(E2Vn(1:2,2:9))]);
A22Vn=mean([mean(E2Vn(8:9,2:9))]);
A23Vn=mean([mean(E2Vn(19:20,2:9))]);
A24Vn=mean([mean(E2Vn(2:9,1:3))]);
A25Vn=mean([mean(E2Vn(2:9,7:10))]);
A26Vn=mean([mean(E2Vn(11:19,2:9))]);
A27Vn=mean([mean(E2Vn(11:19,7:10))]);

A31Vn=mean([mean(E3Vn(1:2,2:9))]);
A32Vn=mean([mean(E3Vn(8:9,2:9))]);
A33Vn=mean([mean(E3Vn(19:20,2:9))]);
A34Vn=mean([mean(E3Vn(2:9,1:3))]);
A35Vn=mean([mean(E3Vn(2:9,7:10))]);
A36Vn=mean([mean(E3Vn(11:19,2:9))]);
A37Vn=mean([mean(E3Vn(11:19,7:10))]);

A41Vn=mean([mean(E4Vn(1:2,2:9))]);
A42Vn=mean([mean(E4Vn(8:9,2:9))]);
A43Vn=mean([mean(E4Vn(19:20,2:9))]);
A44Vn=mean([mean(E4Vn(2:9,1:3))]);
A45Vn=mean([mean(E4Vn(2:9,7:10))]);
A46Vn=mean([mean(E4Vn(11:19,2:9))]);
A47Vn=mean([mean(E4Vn(11:19,7:10))]);

A51Vn=mean([mean(E5Vn(1:2,2:9))]);
A52Vn=mean([mean(E5Vn(8:9,2:9))]);
A53Vn=mean([mean(E5Vn(19:20,2:9))]);
A54Vn=mean([mean(E5Vn(2:9,1:3))]);
A55Vn=mean([mean(E4Vn(2:9,7:10))]);
A56Vn=mean([mean(E5Vn(11:19,2:9))]);
A57Vn=mean([mean(E5Vn(11:19,7:10))]);

A61Vn=mean([mean(E6Vn(1:2,2:9))]);
A62Vn=mean([mean(E6Vn(8:9,2:9))]);
A63Vn=mean([mean(E6Vn(19:20,2:9))]);
A64Vn=mean([mean(E6Vn(2:9,1:3))]);
A65Vn=mean([mean(E6Vn(2:9,7:10))]);
A66Vn=mean([mean(E6Vn(11:19,2:9))]);
A67Vn=mean([mean(E6Vn(11:19,7:10))]);

A71Vn=mean([mean(E7Vn(1:2,2:9))]);
A72Vn=mean([mean(E7Vn(8:9,2:9))]);
A73Vn=mean([mean(E7Vn(19:20,2:9))]);
A74Vn=mean([mean(E7Vn(2:9,1:3))]);
A75Vn=mean([mean(E7Vn(2:9,7:10))]);
A76Vn=mean([mean(E7Vn(11:19,2:9))]);
A77Vn=mean([mean(E7Vn(11:19,7:10))]);

A81Vn=mean([mean(E8Vn(1:2,2:9))]);
A82Vn=mean([mean(E8Vn(8:9,2:9))]);
A83Vn=mean([mean(E8Vn(19:20,2:9))]);
A84Vn=mean([mean(E8Vn(2:9,1:3))]);
A85Vn=mean([mean(E8Vn(2:9,7:10))]);
A86Vn=mean([mean(E8Vn(11:19,2:9))]);
A87Vn=mean([mean(E8Vn(11:19,7:10))]);

A91Vn=mean([mean(E9Vn(1:2,2:9))]);
A92Vn=mean([mean(E9Vn(8:9,2:9))]);
A93Vn=mean([mean(E9Vn(19:20,2:9))]);
A94Vn=mean([mean(E9Vn(2:9,1:3))]);
A95Vn=mean([mean(E9Vn(2:9,7:10))]);
A96Vn=mean([mean(E9Vn(11:19,2:9))]);
A97Vn=mean([mean(E9Vn(11:19,7:10))]);

%Input matrix
Input_test_Method_A_1 = [A01Vn A02Vn A03Vn A04Vn A05Vn A06Vn A07Vn;
    A11Vn A12Vn A13Vn A14Vn A15Vn A16Vn A17Vn;
    A21Vn A22Vn A23Vn A24Vn A25Vn A26Vn A27Vn;
    A31Vn A32Vn A33Vn A34Vn A35Vn A36Vn A37Vn;
    A41Vn A42Vn A43Vn A44Vn A45Vn A46Vn A47Vn;
    A51Vn A52Vn A53Vn A54Vn A55Vn A56Vn A57Vn;
    A61Vn A62Vn A63Vn A64Vn A65Vn A66Vn A67Vn;
    A71Vn A72Vn A73Vn A74Vn A75Vn A76Vn A77Vn;
    A81Vn A82Vn A83Vn A84Vn A85Vn A86Vn A87Vn;
    A91Vn A92Vn A93Vn A94Vn A95Vn A96Vn A97Vn;
    ];


%Method_C_Test_Input_2
% intensity
A01S=mean([mean(E0S(1:2,2:9))]);
A02S=mean([mean(E0S(8:9,2:9))]);
A03S=mean([mean(E0S(19:20,2:9))]);
A04S=mean([mean(E0S(2:9,1:3))]);
A05S=mean([mean(E0S(2:9,7:10))]);
A06S=mean([mean(E0S(11:19,2:9))]);
A07S=mean([mean(E0S(11:19,7:10))]);

A11S=mean([mean(E1S(1:2,2:9))]);
A12S=mean([mean(E1S(8:9,2:9))]);
A13S=mean([mean(E1S(19:20,2:9))]);
A14S=mean([mean(E1S(2:9,1:3))]);
A15S=mean([mean(E1S(2:9,7:10))]);
A16S=mean([mean(E1S(11:19,2:9))]);
A17S=mean([mean(E1S(11:19,7:10))]);

A21S=mean([mean(E2S(1:2,2:9))]);
A22S=mean([mean(E2S(8:9,2:9))]);
A23S=mean([mean(E2S(19:20,2:9))]);
A24S=mean([mean(E2S(2:9,1:3))]);
A25S=mean([mean(E2S(2:9,7:10))]);
A26S=mean([mean(E2S(11:19,2:9))]);
A27S=mean([mean(E2S(11:19,7:10))]);

A31S=mean([mean(E3S(1:2,2:9))]);
A32S=mean([mean(E3S(8:9,2:9))]);
A33S=mean([mean(E3S(19:20,2:9))]);
A34S=mean([mean(E3S(2:9,1:3))]);
A35S=mean([mean(E3S(2:9,7:10))]);
A36S=mean([mean(E3S(11:19,2:9))]);
A37S=mean([mean(E3S(11:19,7:10))]);

A41S=mean([mean(E4S(1:2,2:9))]);
A42S=mean([mean(E4S(8:9,2:9))]);
A43S=mean([mean(E4S(19:20,2:9))]);
A44S=mean([mean(E4S(2:9,1:3))]);
A45S=mean([mean(E4S(2:9,7:10))]);
A46S=mean([mean(E4S(11:19,2:9))]);
A47S=mean([mean(E4S(11:19,7:10))]);

A51S=mean([mean(E5S(1:2,2:9))]);
A52S=mean([mean(E5S(8:9,2:9))]);
A53S=mean([mean(E5S(19:20,2:9))]);
A54S=mean([mean(E5S(2:9,1:3))]);
A55S=mean([mean(E4S(2:9,7:10))]);
A56S=mean([mean(E5S(11:19,2:9))]);
A57S=mean([mean(E5S(11:19,7:10))]);

A61S=mean([mean(E6S(1:2,2:9))]);
A62S=mean([mean(E6S(8:9,2:9))]);
A63S=mean([mean(E6S(19:20,2:9))]);
A64S=mean([mean(E6S(2:9,1:3))]);
A65S=mean([mean(E6S(2:9,7:10))]);
A66S=mean([mean(E6S(11:19,2:9))]);
A67S=mean([mean(E6S(11:19,7:10))]);

A71S=mean([mean(E7S(1:2,2:9))]);
A72S=mean([mean(E7S(8:9,2:9))]);
A73S=mean([mean(E7S(19:20,2:9))]);
A74S=mean([mean(E7S(2:9,1:3))]);
A75S=mean([mean(E7S(2:9,7:10))]);
A76S=mean([mean(E7S(11:19,2:9))]);
A77S=mean([mean(E7S(11:19,7:10))]);

A81S=mean([mean(E8S(1:2,2:9))]);
A82S=mean([mean(E8S(8:9,2:9))]);
A83S=mean([mean(E8S(19:20,2:9))]);
A84S=mean([mean(E8S(2:9,1:3))]);
A85S=mean([mean(E8S(2:9,7:10))]);
A86S=mean([mean(E8S(11:19,2:9))]);
A87S=mean([mean(E8S(11:19,7:10))]);

A91S=mean([mean(E9S(1:2,2:9))]);
A92S=mean([mean(E9S(8:9,2:9))]);
A93S=mean([mean(E9S(19:20,2:9))]);
A94S=mean([mean(E9S(2:9,1:3))]);
A95S=mean([mean(E9S(2:9,7:10))]);
A96S=mean([mean(E9S(11:19,2:9))]);
A97S=mean([mean(E9S(11:19,7:10))]);

%Input matrix
Input_test_Method_A_2 = [A01S A02S A03S A04S A05S A06S A07S;
    A11S A12S A13S A14S A15S A16S A17S;
    A21S A22S A23S A24S A25S A26S A27S;
    A31S A32S A33S A34S A35S A36S A37S;
    A41S A42S A43S A44S A45S A46S A47S;
    A51S A52S A53S A54S A55S A56S A57S;
    A61S A62S A63S A64S A65S A66S A67S;
    A71S A72S A73S A74S A75S A76S A77S;
    A81S A82S A83S A84S A85S A86S A87S;
    A91S A92S A93S A94S A95S A96S A97S;
    ];

%Method_C_Test_Input_3
% intensity
A01Sn=mean([mean(E0Sn(1:2,2:9))]);
A02Sn=mean([mean(E0Sn(8:9,2:9))]);
A03Sn=mean([mean(E0Sn(19:20,2:9))]);
A04Sn=mean([mean(E0Sn(2:9,1:3))]);
A05Sn=mean([mean(E0Sn(2:9,7:10))]);
A06Sn=mean([mean(E0Sn(11:19,2:9))]);
A07Sn=mean([mean(E0Sn(11:19,7:10))]);

A11Sn=mean([mean(E1Sn(1:2,2:9))]);
A12Sn=mean([mean(E1Sn(8:9,2:9))]);
A13Sn=mean([mean(E1Sn(19:20,2:9))]);
A14Sn=mean([mean(E1Sn(2:9,1:3))]);
A15Sn=mean([mean(E1Sn(2:9,7:10))]);
A16Sn=mean([mean(E1Sn(11:19,2:9))]);
A17Sn=mean([mean(E1Sn(11:19,7:10))]);

A21Sn=mean([mean(E2Sn(1:2,2:9))]);
A22Sn=mean([mean(E2Sn(8:9,2:9))]);
A23Sn=mean([mean(E2Sn(19:20,2:9))]);
A24Sn=mean([mean(E2Sn(2:9,1:3))]);
A25Sn=mean([mean(E2Sn(2:9,7:10))]);
A26Sn=mean([mean(E2Sn(11:19,2:9))]);
A27Sn=mean([mean(E2Sn(11:19,7:10))]);

A31Sn=mean([mean(E3Sn(1:2,2:9))]);
A32Sn=mean([mean(E3Sn(8:9,2:9))]);
A33Sn=mean([mean(E3Sn(19:20,2:9))]);
A34Sn=mean([mean(E3Sn(2:9,1:3))]);
A35Sn=mean([mean(E3Sn(2:9,7:10))]);
A36Sn=mean([mean(E3Sn(11:19,2:9))]);
A37Sn=mean([mean(E3Sn(11:19,7:10))]);

A41Sn=mean([mean(E4Sn(1:2,2:9))]);
A42Sn=mean([mean(E4Sn(8:9,2:9))]);
A43Sn=mean([mean(E4Sn(19:20,2:9))]);
A44Sn=mean([mean(E4Sn(2:9,1:3))]);
A45Sn=mean([mean(E4Sn(2:9,7:10))]);
A46Sn=mean([mean(E4Sn(11:19,2:9))]);
A47Sn=mean([mean(E4Sn(11:19,7:10))]);

A51Sn=mean([mean(E5Sn(1:2,2:9))]);
A52Sn=mean([mean(E5Sn(8:9,2:9))]);
A53Sn=mean([mean(E5Sn(19:20,2:9))]);
A54Sn=mean([mean(E5Sn(2:9,1:3))]);
A55Sn=mean([mean(E4Sn(2:9,7:10))]);
A56Sn=mean([mean(E5Sn(11:19,2:9))]);
A57Sn=mean([mean(E5Sn(11:19,7:10))]);

A61Sn=mean([mean(E6Sn(1:2,2:9))]);
A62Sn=mean([mean(E6Sn(8:9,2:9))]);
A63Sn=mean([mean(E6Sn(19:20,2:9))]);
A64Sn=mean([mean(E6Sn(2:9,1:3))]);
A65Sn=mean([mean(E6Sn(2:9,7:10))]);
A66Sn=mean([mean(E6Sn(11:19,2:9))]);
A67Sn=mean([mean(E6Sn(11:19,7:10))]);

A71Sn=mean([mean(E7Sn(1:2,2:9))]);
A72Sn=mean([mean(E7Sn(8:9,2:9))]);
A73Sn=mean([mean(E7Sn(19:20,2:9))]);
A74Sn=mean([mean(E7Sn(2:9,1:3))]);
A75Sn=mean([mean(E7Sn(2:9,7:10))]);
A76Sn=mean([mean(E7Sn(11:19,2:9))]);
A77Sn=mean([mean(E7Sn(11:19,7:10))]);

A81Sn=mean([mean(E8Sn(1:2,2:9))]);
A82Sn=mean([mean(E8Sn(8:9,2:9))]);
A83Sn=mean([mean(E8Sn(19:20,2:9))]);
A84Sn=mean([mean(E8Sn(2:9,1:3))]);
A85Sn=mean([mean(E8Sn(2:9,7:10))]);
A86Sn=mean([mean(E8Sn(11:19,2:9))]);
A87Sn=mean([mean(E8Sn(11:19,7:10))]);

A91Sn=mean([mean(E9Sn(1:2,2:9))]);
A92Sn=mean([mean(E9Sn(8:9,2:9))]);
A93Sn=mean([mean(E9Sn(19:20,2:9))]);
A94Sn=mean([mean(E9Sn(2:9,1:3))]);
A95Sn=mean([mean(E9Sn(2:9,7:10))]);
A96Sn=mean([mean(E9Sn(11:19,2:9))]);
A97Sn=mean([mean(E9Sn(11:19,7:10))]);

%Input matrix
Input_test_Method_A_3 = [A01Sn A02Sn A03Sn A04Sn A05Sn A06Sn A07Sn;
    A11Sn A12Sn A13Sn A14Sn A15Sn A16Sn A17Sn;
    A21Sn A22Sn A23Sn A24Sn A25Sn A26Sn A27Sn;
    A31Sn A32Sn A33Sn A34Sn A35Sn A36Sn A37Sn;
    A41Sn A42Sn A43Sn A44Sn A45Sn A46Sn A47Sn;
    A51Sn A52Sn A53Sn A54Sn A55Sn A56Sn A57Sn;
    A61Sn A62Sn A63Sn A64Sn A65Sn A66Sn A67Sn;
    A71Sn A72Sn A73Sn A74Sn A75Sn A76Sn A77Sn;
    A81Sn A82Sn A83Sn A84Sn A85Sn A86Sn A87Sn;
    A91Sn A92Sn A93Sn A94Sn A95Sn A96Sn A97Sn;
    ];
