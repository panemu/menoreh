import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/injections.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class CountryFormPage extends StatefulWidget {
  final CountryEntity? country;

  const CountryFormPage({Key? key, this.country}) : super(key: key);

  @override
  State<CountryFormPage> createState() => _CountryFormPageState();
}

class _CountryFormPageState extends State<CountryFormPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController = TextEditingController();
  late TextEditingController capitalCountroller = TextEditingController();
  late TextEditingController inpendenceController = TextEditingController();
  late TextEditingController populationController = TextEditingController();
  late String? continent = '';

  @override
  void initState() {
    super.initState();
    if (widget.country != null) {
      nameController = TextEditingController(text: widget.country!.name);
      capitalCountroller = TextEditingController(text: widget.country!.capital);
      inpendenceController = TextEditingController(text: widget.country!.independence.toDateTime().yMMMMd);
      populationController = TextEditingController(text: widget.country!.population.textDecimalDigit);
      continent = widget.country!.continent;
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    capitalCountroller.dispose();
    inpendenceController.dispose();
    populationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryCubit>(
          create: (_) => sl<CountryCubit>(),
        ),
        BlocProvider<CountryPostCubit>(
          create: (_) => sl<CountryPostCubit>(),
        ),
        BlocProvider<CountryPutCubit>(
          create: (_) => sl<CountryPutCubit>(),
        ),
      ],
      child: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, _) {
          return BlocConsumer<CountryPostCubit, CountryPostState>(
            listener: (_, statePost) {
              if (statePost.status.isLoading) {
                SmartDialog.showLoading();
              } else if (statePost.status.isLoaded) {
                SmartDialog.dismiss();
                context.router.pop<AnswerState>(AnswerState.yesOk);
              } else if (statePost.status.isNotLoaded) {
                SmartDialog.dismiss();
                AppDialog.handleError(context, statePost.errorMessage!);
              }
            },
            builder: (ctxPost, _) {
              return BlocConsumer<CountryPutCubit, CountryPutState>(
                listener: (_, statePut) {
                  if (statePut.status.isLoading) {
                    SmartDialog.showLoading();
                  } else if (statePut.status.isLoaded) {
                    SmartDialog.dismiss();
                    context.router.pop<AnswerState>(AnswerState.yesOk);
                  } else if (statePut.status.isNotLoaded) {
                    SmartDialog.dismiss();
                    AppDialog.handleError(context, statePut.errorMessage!);
                  }
                },
                builder: (ctxPut, _) {
                  return ContentDialogForm(
                    onYesOk: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        if (widget.country == null) {
                          final request = CountryRequestEntity(
                            id: 0,
                            name: nameController.text,
                            capital: capitalCountroller.text,
                            continent: continent!,
                            independence: inpendenceController.text.textDateTimeOnly,
                            population: populationController.text.numberDigitOnly,
                            version: 0,
                          );

                          ctxPost.read<CountryPostCubit>().postData(request);
                        } else {
                          final request = CountryRequestEntity(
                            id: widget.country!.id,
                            name: nameController.text,
                            capital: capitalCountroller.text,
                            continent: continent!,
                            independence: inpendenceController.text.textDateTimeOnly,
                            population: populationController.text.numberDigitOnly,
                            version: widget.country!.version,
                          );

                          ctxPut.read<CountryPutCubit>().putData(request);
                        }
                      }
                    },
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFieldBasic(
                            controller: nameController,
                            title: 'Country Name',
                            hint: 'Enter Country Name',
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Country Name is Empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppDimens.size3M),
                          TextFieldBasic(
                            controller: capitalCountroller,
                            title: 'Capital City Name',
                            hint: 'Enter Capital City Name',
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Capital Name is Empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppDimens.size3M),
                          TextFieldDropdownSearch<String>(
                            onChanged: (String? value) => continent = value,
                            selectedItem: widget.country == null ? null : widget.country!.continent,
                            title: 'Continent Name',
                            hint: 'Enter Continent Name',
                            itemAsString: (element) => element.toString(),
                            compareFn: (selected, val) => val == null ? false : selected == val,
                            items: AppUtils.continentList,
                            validator: (String? value) {
                              if (value == null) {
                                return 'Continent Name is Empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppDimens.size3M),
                          TextFieldDatePicker(
                            controller: inpendenceController,
                            title: 'Date of Independence',
                            hint: 'Enter Date Independence',
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Independence Date is Empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppDimens.size3M),
                          TextFieldBasic(
                            controller: populationController,
                            title: 'Population',
                            hint: 'Enter Population',
                            inputType: TextInputType.number,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Population is Empty';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
