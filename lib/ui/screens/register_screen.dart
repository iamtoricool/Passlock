import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:passblock/ui/app_theme/design_constants.dart';
import 'package:passblock/ui/app_theme/theme_colors.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _phoneNumberController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/icons/Icon.png',
                    height: 155,
                    width: 180,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 28),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ThemeColors().darkColor, width: 2),
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Container(
                            height: 60,
                            width: 346,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ThemeColors().darkColor, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child: TabBar(
                                indicator: CustomIndicator(),
                                overlayColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.transparent),
                                labelColor: ThemeColors().whiteColor,
                                unselectedLabelColor: ThemeColors().darkColor,
                                controller: _tabController,
                                // ignore: prefer_const_literals_to_create_immutables
                                tabs: [
                                  const Text('Register'),
                                  const Text('Login'),
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Container(
                          height: 280,
                          child:
                              TabBarView(controller: _tabController, children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Personal details',
                                    style: GoogleFonts.poppins(
                                        color: ThemeColors().darkColor,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  GetTextField(
                                      textFieldType: TextFieldType.NAME,
                                      label: 'First Name',
                                      controller: _firstNameController),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  GetTextField(
                                    textFieldType: TextFieldType.NAME,
                                    label: 'Last Name',
                                    controller: _lastNameController,
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  GetTextField(
                                      controller: _phoneNumberController,
                                      textFieldType: TextFieldType.PHONE,
                                      label: 'Mobile no.')
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Enter mobile no.',
                                    style: GoogleFonts.poppins(
                                        color: ThemeColors().darkColor,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  GetTextField(
                                      controller: _phoneNumberController,
                                      textFieldType: TextFieldType.PHONE,
                                      label: 'Mobile no.')
                                ],
                              ),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  RectangularIndicator CustomIndicator() {
    return RectangularIndicator(
        horizontalPadding: 8,
        verticalPadding: 8,
        topLeftRadius: 7,
        topRightRadius: 7,
        bottomLeftRadius: 7,
        bottomRightRadius: 7);
  }
}
