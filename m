Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E73949DC9D
	for <lists+nbd@lfdr.de>; Thu, 27 Jan 2022 09:36:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6DB30203EB; Thu, 27 Jan 2022 08:36:04 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 27 08:36:04 2022
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 984CA203EA
	for <lists-other-nbd@bendel.debian.org>; Thu, 27 Jan 2022 08:35:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=2,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4Dzl5H1iBNq0 for <lists-other-nbd@bendel.debian.org>;
	Thu, 27 Jan 2022 08:35:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 540EA203C5
	for <nbd@other.debian.org>; Thu, 27 Jan 2022 08:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:References:In-Reply-To:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZNC1jcF8h4V9jphHp/l1n/081GjYch84GSJ1LOhlSjA=; b=WsU2rcDWr/cmDqs0c5fTJn0gQ+
	xPkrULqnHG/SxzUQHdxIaId3dSgNr7jBdZI/Ut9ljT4cvfRK5ssoW+G8NOyGmtF5s21huW5k1d1aw
	TYX/z925lHnDDw5YFLag4tE5HlPIZQ+O6oQSAPmGnfOYY3YLmFRDhVwWcjFPtqPvkcOt3mfBPyVYF
	sPaRp7vFF/qpQnL1EbZR2ED4gRc5rHBoAmcP+lzYfIXbXiC5Jo1fzpUUI7M6GjT4H67ow/PDv2zZk
	j6zonjnE8XLDAjKMqxy2dvnCFcm/lrVG+6YBYnY7MoZJqjOCMwwbiQYDtt1R66YKLpisOkhxLYODw
	tS9PgCtQ==;
Received: from [41.13.228.138] (helo=[127.0.0.1])
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1nD0Fz-003Sth-JE
	for nbd@other.debian.org; Thu, 27 Jan 2022 09:35:51 +0100
Date: Thu, 27 Jan 2022 10:34:51 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: Re: [PATCH 0/9] Add data to datalog, add replay tool, V03
User-Agent: K-9 Mail for Android
In-Reply-To: <20220121175711.5083-1-manfred@colorfullife.com>
References: <20220121175711.5083-1-manfred@colorfullife.com>
Message-ID: <403C0885-CD51-4E1E-964C-553AB6D18458@uter.be>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----T52M1AE2R9GE62WJNMK3YQDRWJVYNO
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2otjHis481D.A.ay.0ll8hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1707
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/403C0885-CD51-4E1E-964C-553AB6D18458@uter.be
Resent-Date: Thu, 27 Jan 2022 08:36:04 +0000 (UTC)

------T52M1AE2R9GE62WJNMK3YQDRWJVYNO
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

This looks great at first sight=2E

Unfortunately I'm rather busy at the moment (I'm deeply involved in FOSDEM=
), so I won't be able to review this in detail into early next month=2E

I intend to do a release to fix the security issues that were pointed out =
then, and also incorporate this if we can manage it, though if there are si=
gnificant issues I don't plan on deleting the release for that, at least no=
t much=2E

Manfred Spraul <manfred@colorfullife=2Ecom> schreef op 21 januari 2022 19:=
57:02 GMT+02:00:
>Hi,
>
>Updated series=2E
>New is:
>- Patch 0004: Update proto=2Emd
>- Patch 0009: An initial man page=2E
>
>Review feedback is welcome!
>
>And: What else is needed for a new tool?
>Should I try to create a test case?
>
>--
>	Manfred
>
>

--=20
Verstuurd vanaf mijn Android apparaat met K-9 Mail=2E Excuseer mijn beknop=
theid=2E
------T52M1AE2R9GE62WJNMK3YQDRWJVYNO
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Hi,<br><br>This looks great at first sight=2E<br><=
br>Unfortunately I'm rather busy at the moment (I'm deeply involved in FOSD=
EM), so I won't be able to review this in detail into early next month=2E<b=
r><br>I intend to do a release to fix the security issues that were pointed=
 out then, and also incorporate this if we can manage it, though if there a=
re significant issues I don't plan on deleting the release for that, at lea=
st not much=2E<br><br><div class=3D"gmail_quote">Manfred Spraul &lt;manfred=
@colorfullife=2Ecom&gt; schreef op 21 januari 2022 19:57:02 GMT+02:00:<bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-l=
eft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre dir=3D"auto" class=3D"k9mail">Hi,<br><br>Updated series=2E<br>New is:=
<br>- Patch 0004: Update proto=2Emd<br>- Patch 0009: An initial man page=2E=
<br><br>Review feedback is welcome!<br><br>And: What else is needed for a n=
ew tool?<br>Should I try to create a test case?<br><br>--<br>	Manfred<br><b=
r><br></pre></blockquote></div><div style=3D'white-space: pre-wrap'><div cl=
ass=3D'k9mail-signature'>-- <br>Verstuurd vanaf mijn Android apparaat met K=
-9 Mail=2E Excuseer mijn beknoptheid=2E</div></div></body></html>
------T52M1AE2R9GE62WJNMK3YQDRWJVYNO--

