object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'fmMain'
  ClientHeight = 571
  ClientWidth = 961
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 15
  object pnMain: TPanel
    Left = 0
    Top = 0
    Width = 961
    Height = 571
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object pnAdicionaCota: TPanel
      Left = 0
      Top = 0
      Width = 961
      Height = 217
      Align = alTop
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object lbNome: TLabel
        Left = 56
        Top = 77
        Width = 36
        Height = 15
        Caption = 'Nome:'
      end
      object lbPreco: TLabel
        Left = 224
        Top = 77
        Width = 60
        Height = 15
        Caption = 'Pre'#231'o pago'
      end
      object lbQtd: TLabel
        Left = 392
        Top = 77
        Width = 67
        Height = 15
        Caption = 'Qtd de cotas'
      end
      object lbLucroCota: TLabel
        Left = 568
        Top = 77
        Width = 77
        Height = 15
        Caption = 'Lucro por cota'
      end
      object imAdiciona: TImage
        Left = 761
        Top = 85
        Width = 49
        Height = 49
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
          003008060000005702F987000000097048597300000B1300000B1301009A9C18
          000003A74944415478DAED995D48544114C767EEEEDA073E88A5142A11110A81
          468AD5A33D84B56BEE2AAB923D0485162AF4960A2146A1BD969A26F42454AE7A
          35772322045F0A4C21AD870C82328DCA0F84C4D0FD38FDAFAC18B67BDDBDFB71
          EF860764D6B97766CE6FE69C3367E67216E3C2D556601B406D05340160EDB6EA
          7EEB9DB9C4290F1D6613F10C94FB19A7F8B517882F1163DF38A7499463824718
          3A369139D2D8D8E85115A0502C4C7313AFC2CF0BE82925B8D6340D982EB74768
          7D5E2C4E471520BFDB9AA437386F11A38B9CF1B85026017DACA278C875EE1BF6
          73F6B9880398C4C2F328EEA16962288AFB0099671EA1DA512C3E8E0840764785
          615FD2CF36CED9E5702AFE0F08B18EEFB3C93563950F9C6103303D35ED26B7AE
          07E6722692CA6F50B0674CEFB2C2A4964306589BF9E41F0351537E03E2E52E97
          C1682BB1AD860460EC337746DA6CFC3350BBC33270553180B1D752CE05EA5243
          F9BF30CAEC968127410398FBCC7BE0451F30FB7B550658603A77BABF10EB17C0
          249A3B5054281972D02CFAAC2FE8B7284320D6E628EAAF0A1820BFD792AA133C
          9F946E526107C066878DEE3056612A2000539FB9194FAE2B1A2D02005E886638
          74DD96000D0D0DC2D8D1B75FF028554B00209841583D80B0EA9605C0EC9F44ED
          2BE523450880ADF9C271F8C2882C80512CAC87EDDFD6220056A1CE5ED4DF2C0B
          8015E8436D48234510A00700565900ECBCEF11FB8F285552A9040447EC1D0032
          6501902ECF07922AAB01001F98830F24C902C007560289FF2AADC00A5660E7FF
          0D10FB2614F34E1CF36154C31B19F2A15AE4437764010A7A2D2748A0D75A0460
          1E9E6B2F16DFC80248C9DC68D6F867F8419A9600E0C05339E3590737DFE6F94C
          A761464D30A35A2D0100A10947CBFACDB53171A091E23F199C871C058E998000
          24C12ADC07C0154D00306AC1ECD7F87AE217E074B735D1A0774EAA7DA897AE1C
          719CCC08FA502F89B1D752C6057AA42A00F112479168F3F73C908BAD76AC42A5
          2ACA336A45DCAF967B674B00E9E3C5B2DED903087394D577FC4A58340FE70DBB
          42029044BADC652EBD0D6F9F8D8AEA8CECB0FBD2B05CEEAE8BF792F7AED2C814
          84F2AD4B098BD7B69AF9A001D605E976291CAB25FCD1896689842A39870D0B80
          24DE7BD39B687C093DEC084D6FB6C23875AE3AE31A5E94D816826D1ED2473EE3
          A03105BE51CD8897079B3B21B7F9CA397591DED5EA6B878D0AC0BA7813C01C74
          760AFF66E32F1DB39A428CC57B075982D94DA3FC489C46B94718CA9EC81C53FD
          33AB16641B406D8979803FDF12AE400A3E8B8C0000000049454E44AE426082}
        OnClick = imAdicionaClick
      end
      object edNome: TEdit
        Left = 56
        Top = 98
        Width = 153
        Height = 23
        TabOrder = 0
        TextHint = 'Digite o nome da cota'
      end
      object edPreco: TEdit
        Left = 224
        Top = 98
        Width = 153
        Height = 23
        TabOrder = 1
        TextHint = 'Digite o valor pago da cota'
        OnExit = edExitMoeda
      end
      object edQtd: TEdit
        Left = 392
        Top = 98
        Width = 153
        Height = 23
        TabOrder = 2
        TextHint = 'Digite o n'#250'mero de cotas'
      end
      object edLucroCota: TEdit
        Left = 568
        Top = 98
        Width = 161
        Height = 23
        ImeName = 'ed'
        TabOrder = 3
        TextHint = 'Digite o lucro medio da cota'
        OnExit = edExitMoeda
      end
      object pnLixeiraLateral: TPanel
        Left = 819
        Top = 1
        Width = 141
        Height = 215
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 4
        object imLixeira: TImage
          Left = 68
          Top = 80
          Width = 41
          Height = 41
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000280000
            002808060000008CFEB86D000000097048597300000B1300000B1301009A9C18
            000004AC4944415478DAEDD86D4C13771800F0E75A287D810E045A4AA1D0D281
            F460040B52E8981B8A0C756E0344B34527FAC125CB169745BF6DD9FC36B76C99
            1FF6926824C42C1B206493B0891206C3525EEC1C6B8B05CA4BA196E345B1400B
            D8F6762D811904EDB5E746329E2FEDFDEFFECFFDFAF47FFF3C2D021B3C90FF1A
            B009DC045291243E1E3DE842E07D04C703DCC738823870DCF5C5C8504FE58600
            8AC4A87AC146DF8961DD73EEE348992C986547AE9B06758A7F159820DABA2D9C
            C5FADAE1C2A31E1EB73A1D3C2E3D60FC49638134C43269B7BF6334DDD6500E14
            2426460811CE5F1753B64589982C9FAA619AB74399563366C6E7522DBDBD937E
            03E572792032E32A77E1B872D6E9DCB28F17C541834368645002061312D86C30
            DA6C9EE3C6BBE3AEFA09CCCAA2D1EFD310A4B54BC03D0ACDCD0E9F80C4DA2A2E
            E6092A3E4A486213C97CAADA7A417C68F8C478DB563B317678784057E313302E
            2E395DC462371E11C685D2106AB724170E78857978DA64B7E70D0FEB6FF90474
            07B185A4B900DEDB2D921EC911C6065081BB613639AE998C15C45A393734A4FB
            F371D77A5515A292856529193F7C205772A9009EBDD96AADD06A0E1295FBF549
            D77A058C11A399FB2589F59F2A0B2296C7BE6DBB0ECEC505D883668038820F36
            E2FD776D8D44421C4EE4E4032B9001035318FCA2ED820046109CC8DEB592EF74
            EBD5C9BAA1BEC29101E2241540912855A2100A5517F25FE32F8F55DE688022BE
            006AEDF370203513F46323E0C0463DE702F831208B8A853ABD065E6604420D66
            8152E5EE957CC7AED562ED664BB6C9D43D4809502A957225DCE8BECBFBDEE0AD
            00550D50C28F86EAB939287D2E0B7463A3808F8F2C25E5C5021A1503F67B1310
            7417836AEC0E94E6FC037CBDEEFBF191394C6A3018662801BA232745815D2D3A
            4A0A7885A8E0DE20C623C0FC9AF209B556CDF3E6BE5E03B7A359771A8BCB0454
            5470E7E58B960E5D7B34A5407972A6A9E9C0B1D8E5EDD01B6065773B9470388F
            005FAABA60EAEAE98CA314988966E9AEEC7F53C6219E4E7F80B30F16E1D59F2E
            E93AF41D29940215A8A2A5BCA0285718CCF50B383A6385B2869A16B54EBD8352
            60564A56D5973BF694A486F3FD026A273138D95C5FD5AE6B2FA5149891BCFDDC
            999CBC777385F17E015BCC43F0715BE3579DFACE939402932569A73E54E69D7D
            459CE417F0E701039C696B3A6530DEFA9C52A0281E3D7C5AFEFCF9B7D074C6E3
            8091C4438408C4C00BDDB226B05CA759FC4CA33A6E1AD45EA214B8BA61580F28
            E384001223052488B926904CA3400AB8BA61580F2862B2018996404870C89A40
            328D02B9AF986818B26384AAF3BB961A065FD7E071A251507BD9289002AE6E18
            BE69A987DCD03098643F032F4A6560B1DE03B5EEA6E75A052A0701370C9AFAB4
            C0B3CDC0EFF7A7E1ED170A3DE7C8340AA480EE78B8611824F6B3E1E929D821DD
            4A2459FA1DF58779A928E942B1E7150717FCD6DF03E2301EC487477AC60A6ACA
            C7555A35DFDB7B920266C8327B2BF71E7A3692C521336D2530DB1C1CAAFFB1B7
            4BDF91F454808992342597C5AC4E0BE7D319743AA9B98B4E27DE3D8539ACF3B3
            2506A34EF55480EE20D66290D3C94C72D2904032F3E82EFC019D3E6FE8EFEF5F
            2033EFFFF1EFD6267023C726D0DFF81BFE3D9F47C7EB3D030000000049454E44
            AE426082}
          OnClick = imLixeiraClick
        end
        object lbLixeira: TLabel
          Left = 47
          Top = 125
          Width = 86
          Height = 15
          Alignment = taRightJustify
          Caption = 'Remove registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
      end
    end
    object dbGridInvestimento: TDBGrid
      Left = 0
      Top = 217
      Width = 961
      Height = 354
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsGridInvestimento
      ImeName = 'valorInvestido'
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          ImeName = 'nome'
          Title.Caption = 'Nome'
          Width = 198
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          ImeName = 'preco'
          Title.Caption = 'Pre'#231'o'
          Width = 148
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtd'
          ImeName = 'qtd'
          Title.Caption = 'Quantidade'
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lucro'
          ImeName = 'lucro'
          Title.Caption = 'Lucro unit cota'
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorInvestido'
          Title.Caption = 'Valor investido'
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lucroMensal'
          ImeName = 'lucroMensal'
          Title.Caption = 'Lucro Mensal'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lucroAnual'
          ImeName = 'lucroAnual'
          Title.Caption = 'Lucro Anual'
          Width = 114
          Visible = True
        end>
    end
  end
  object dsGridInvestimento: TDataSource
    Left = 72
    Top = 296
  end
end
