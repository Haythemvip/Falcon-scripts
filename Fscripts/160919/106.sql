 

ALTER PROCEDURE [dbo].[CarContract_Add_Update]
    @ContYear SMALLINT ,
    @contno BIGINT ,
    @conttype NVARCHAR(1) ,
    @fileno NVARCHAR(10) ,
    @idno BIGINT ,
    @kidno1 BIGINT ,
    @kidno2 BIGINT ,
    @shaseno NVARCHAR(10) ,
    @saccno BIGINT ,
    @baccno BIGINT ,
    @price MONEY ,
    @Cost MONEY ,
    @fpay MONEY ,
    @sstate NVARCHAR(1) ,
    @Collecter TINYINT = 0,
    @Collplace TINYINT = 0,
    @contdate NVARCHAR(10) ,
    @gestcount TINYINT ,
    @gestval MONEY ,
    @fgest MONEY ,
    @fgsd NVARCHAR(10) ,
    @lgest MONEY ,
    @lgsd NVARCHAR(10) ,
    @fshahid NVARCHAR(35) ,
    @fshahidid NVARCHAR(12) ,
    @sshahid NVARCHAR(35) ,
    @sshahidid NVARCHAR(10) ,
    @remarks NVARCHAR(MAX) ,
    @caschOrLoan BIT ,
    @AutoTransGest BIT ,
    @IsBox BIT ,
    @IsBank BIT ,
    @Box_Bank_ID BIGINT = 0,
	@contAmounttxt NVARCHAR(500) = '-',
	@BakyAmount NVARCHAR( 250)
AS
    BEGIN
	

        UPDATE  [contract]
        SET     [fileno] = @fileno ,
                [idno] = @idno ,
                [kidno1] = @kidno1 ,
                [kidno2] = @kidno2 ,
                [shaseno] = @shaseno ,
                [saccno] = @saccno ,
                [baccno] = @baccno ,
                [price] = @price ,
                [Cost] = @Cost ,
                [fpay] = @fpay ,
                [sstate] = @sstate ,
                [Collecter] = @Collecter ,
                [Collplace] = @Collplace ,
                [contdate] = @contdate ,
                [gestcount] = @gestcount ,
                [gestval] = @gestval ,
                [fgest] = @fgest ,
                [fgsd] = @fgsd ,
                [lgest] = @lgest ,
                [lgsd] = @lgsd ,
                [fshahid] = @fshahid ,
                [fshahidid] = @fshahidid ,
                [sshahid] = @sshahid ,
                [sshahidid] = @sshahidid ,
                [remarks] = @remarks ,
                [caschOrLoan] = @caschOrLoan ,
                [AutoTransGest] = @AutoTransGest ,
                [IsBox] = @IsBox ,
                [IsBank] = @IsBank ,
                [Box_Bank_ID] = @Box_Bank_ID,
				[contAmounttxt] = @contAmounttxt,
				[BakyAmount] = @BakyAmount
        WHERE   ContYear = @ContYear
                AND contno = @contno
                AND conttype = @conttype
    

    END
