Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EFF948B03
	for <lists+nbd@lfdr.de>; Tue,  6 Aug 2024 10:15:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0E047205F1; Tue,  6 Aug 2024 08:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug  6 08:15:09 2024
Old-Return-Path: <piotr.pastuszak@totradecosts.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,META_POLISH_TO_NON_POLISH_LIST
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 220AB204EF
	for <lists-other-nbd@bendel.debian.org>; Tue,  6 Aug 2024 07:59:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.82 tagged_above=-10000 required=5.3
	tests=[BAYES_40=-0.01, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	META_POLISH_TO_NON_POLISH_LIST=4, UNWANTED_LANGUAGE_BODY=0.03]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8rIab3VN2_3t for <lists-other-nbd@bendel.debian.org>;
	Tue,  6 Aug 2024 07:59:21 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 496 seconds by postgrey-1.36 at bendel; Tue, 06 Aug 2024 07:59:21 UTC
Received: from mail.totradecosts.pl (mail.totradecosts.pl [217.61.97.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7C0DE204E9
	for <nbd@other.debian.org>; Tue,  6 Aug 2024 07:59:21 +0000 (UTC)
Received: by mail.totradecosts.pl (Postfix, from userid 1002)
	id 6856C829D1; Tue,  6 Aug 2024 09:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=totradecosts.pl;
	s=mail; t=1722930661;
	bh=Ob/UiIh7dvVik5hHRpcVwVnGpnuOiTO3ZZS07sdQB1Q=;
	h=Date:From:To:Subject:From;
	b=xCTb6D1yKZPZ4qQ5SSxjJdxMzQmr6m+0P0O2CO6XbEnFmqX64ua5Aev/kDBoOdlE7
	 fKLnDax3qk/gvDxAsnDycuvd9zKmiMhwy1o8AaBVkyVPyGvQ9ZFI9MzlHDd9k77qL+
	 KPEBN1o7i0twdpdx28A1QVnueYn40IGXi7arHfOm2oBfW1e72yEFhazsvsTx5BMkc7
	 ubMHpr7uqf4w28BIZgbRE7w+F+zZksLhM6CRipv7t3Bh97z3dL5BJxOk5DuiMF+Sgk
	 dDg7Rs3NEKRTqYs3yjw59JKKgG7tIxubFPGUpNxsQpUF3KKMN4W7akpLeka7l05YeS
	 Uasjnu0aai0qw==
Received: by mail.totradecosts.pl for <nbd@other.debian.org>; Tue,  6 Aug 2024 07:50:43 GMT
Message-ID: <20240806084500-0.1.30.dfil.0.wo9njbgfym@totradecosts.pl>
Date: Tue,  6 Aug 2024 07:50:43 GMT
From: "Piotr Pastuszak" <piotr.pastuszak@totradecosts.pl>
To: <nbd@other.debian.org>
Subject: =?UTF-8?Q?Wyzerowanie_wp=C5=82at_na_PFRON?=
X-Mailer: mail.totradecosts.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5tohk9L7F-B.A.lKiH.NudsmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3121
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240806084500-0.1.30.dfil.0.wo9njbgfym@totradecosts.pl
Resent-Date: Tue,  6 Aug 2024 08:15:10 +0000 (UTC)

Szanowni Pa=C5=84stwo,

czy wiedz=C4=85 Pa=C5=84stwo, =C5=BCe osoby z orzeczeniem o niepe=C5=82no=
sprawno=C5=9Bci cz=C4=99sto przynosz=C4=85 nieocenione korzy=C5=9Bci dla =
firm, nie tylko w zakresie organizacyjnym, ale r=C3=B3wnie=C5=BC finansow=
ym?

Niepe=C5=82nosprawno=C5=9Bci, z jakimi si=C4=99 spotykamy, cz=C4=99sto ni=
e s=C4=85 widoczne, ale zawsze id=C4=85 w parze z niezwyk=C5=82=C4=85 ela=
styczno=C5=9Bci=C4=85, kreatywno=C5=9Bci=C4=85 i zdolno=C5=9Bci=C4=85 do =
efektywnego radzenia sobie w r=C3=B3=C5=BCnych sytuacjach. To w=C5=82a=C5=
=9Bnie te cechy mog=C4=85 przynie=C5=9B=C4=87 nowatorskie rozwi=C4=85zani=
a i wzmocni=C4=87 innowacyjno=C5=9B=C4=87 Pa=C5=84stwa firmy.

Z sukcesem wspieramy przedsi=C4=99biorc=C3=B3w w redukcji koszt=C3=B3w zw=
i=C4=85zanych z obowi=C4=85zkowymi op=C5=82atami PFRON. Zrealizowali=C5=9B=
my setki projekt=C3=B3w, kt=C3=B3re przynios=C5=82y naszym klientom oszcz=
=C4=99dno=C5=9Bci przekraczaj=C4=85ce 8 milion=C3=B3w z=C5=82otych.

Jest to rezultat naszego zaanga=C5=BCowania w dostosowanie strategii rekr=
utacyjnych do specyficznych potrzeb biznesowych.

Czy chcieliby Pa=C5=84stwo skorzysta=C4=87 z bezp=C5=82atnej konsultacji?


Pozdrawiam
Piotr Pastuszak

