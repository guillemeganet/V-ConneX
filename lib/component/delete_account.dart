import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infy_vcard/flutter_flow/flutter_flow_util.dart';
import 'package:infy_vcard/screens/setting_screen/setting_screen_model.dart';
import '../auth/custom_auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../custom_code/actions/custom_snackbar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class DeleteAccountDialog extends StatefulWidget {
  const DeleteAccountDialog({super.key});

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  late SettingScreenModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingScreenModel());
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 350.0,
            maxHeight: 250.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/alert.png',
                    width: 65.0,
                    height: 65.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '51snl92' /* Delete */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito Sans'),
                        ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '515snl92' /* Are you sure you want to delete this Account? */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito Sans',
                          color: const Color(0xFF79818A),
                          fontWeight: FontWeight.normal,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Nunito Sans'),
                        ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.safePop();
                          },
                          text: FFLocalizations.of(context).getText(
                            '1w5hmry4' /* Cancel */,
                          ),
                          options: FFButtonOptions(
                            width: 145.0,
                            height: 45.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFFF6F8F9),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: const Color(0xFF79818A),
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            ///For Demo Apk
                            // if(FFAppState().email == 'admin@vcard.com'){
                            //   await actions.customSnackbar(
                            //           context,
                            //           FFLocalizations.of(context).getVariableText(
                            //             enText: 'This action not allowed for default records.',
                            //             arText: 'هذا الإجراء غير مسموح به للسجلات الافتراضية.',
                            //             zh_HansText: '默认记录不允许此操作.',
                            //             frText: "Cette action n'est pas autorisée pour les enregistrements par défaut.",
                            //             deText: 'Diese Aktion ist für Standarddatensätze nicht zulässig.',
                            //             ptText: 'Esta ação não é permitida para registros padrão.',
                            //             ruText: 'Это действие не разрешено для стандартных записей.',
                            //             esText: 'Esta acción no está permitida para registros predeterminados.',
                            //             trText: 'Bu işlem varsayılan kayıtlar için izin verilmez.',
                            //           ),
                            //           FlutterFlowTheme.of(context).error,
                            //         );
                            // }else{
                            //   _model.deleteAccountResponse = await VcardGroup.deleteAccount.call(
                            //     authToken: FFAppState().authToken,
                            //     id: FFAppState().user_Id,
                            //   );
                            //
                            //   if (getJsonField(
                            //     (_model.deleteAccountResponse?.jsonBody ?? ''),
                            //     r'''$.success''',
                            //   ) ==
                            //       true) {
                            //     setAppLanguage(context, 'en');
                            //     FFAppState().authToken = '';
                            //     FFAppState().email = '';
                            //     FFAppState().role = '';
                            //
                            //     customSnackbar(
                            //         context,
                            //         FFLocalizations.of(context).getVariableText(
                            //           enText: 'Account Deleted Successfully.',
                            //           arText: 'تم حذف الحساب بنجاح.',
                            //           zh_HansText: 'Konto erfolgreich gelöscht.',
                            //           frText: 'Cuenta eliminada con éxito.',
                            //           deText: 'Compte supprimé avec succès.',
                            //           ptText: 'Conta excluída com sucesso.',
                            //           ruText: 'Аккаунт успешно удален.',
                            //           esText: 'Hesap başarıyla silindi.',
                            //           trText: '账户已成功删除',
                            //         ),
                            //         Colors.green);
                            //
                            //     GoRouter.of(context).prepareAuthEvent();
                            //     await authManager.signOut();
                            //     GoRouter.of(context).clearRedirectLocation();
                            //     context.goNamedAuth('login_screen', context.mounted);
                            //     setState(() {});
                            //   } else {
                            //     context.safePop();
                            //     customSnackbar(context, 'Something went wrong', FlutterFlowTheme.of(context).error);
                            //   }
                            // }

                            ///For Regular ApK
                            _model.deleteAccountResponse =
                                await VcardGroup.deleteAccount.call(
                              authToken: FFAppState().authToken,
                              id: FFAppState().user_Id,
                            );

                            if (getJsonField(
                                  (_model.deleteAccountResponse?.jsonBody ??
                                      ''),
                                  r'''$.success''',
                                ) ==
                                true) {
                              setAppLanguage(context, 'en');
                              FFAppState().authToken = '';
                              FFAppState().email = '';
                              FFAppState().role = '';

                              customSnackbar(
                                  context,
                                  FFLocalizations.of(context).getVariableText(
                                    enText: 'Account Deleted Successfully.',
                                    arText: 'تم حذف الحساب بنجاح.',
                                    zh_HansText: 'Konto erfolgreich gelöscht.',
                                    frText: 'Cuenta eliminada con éxito.',
                                    deText: 'Compte supprimé avec succès.',
                                    ptText: 'Conta excluída com sucesso.',
                                    ruText: 'Аккаунт успешно удален.',
                                    esText: 'Hesap başarıyla silindi.',
                                    trText: '账户已成功删除',
                                  ),
                                  Colors.green);

                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();
                              context.goNamedAuth(
                                  'login_screen', context.mounted);
                              setState(() {});
                            } else {
                              context.safePop();
                              customSnackbar(context, 'Something went wrong',
                                  FlutterFlowTheme.of(context).error);
                            }
                          },
                          text: FFLocalizations.of(context).getText(
                            '51snl92' /* Delete */,
                          ),
                          options: FFButtonOptions(
                            width: 145.0,
                            height: 45.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF1F69F6),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Nunito Sans'),
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ]
                        .divide(const SizedBox(width: 15.0))
                        .addToStart(const SizedBox(width: 5.0))
                        .addToEnd(const SizedBox(width: 5.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
