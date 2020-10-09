Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 63515288948
	for <lists+nbd@lfdr.de>; Fri,  9 Oct 2020 14:51:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4C0B8203BF; Fri,  9 Oct 2020 12:51:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct  9 12:51:19 2020
Old-Return-Path: <bintoudeme157@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=4.0 tests=CAPINIT,DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,MALFORMED_FREEMAIL,
	MDO_DATING14,MISSING_HEADERS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	REPLYTO_WITHOUT_TO_CC autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1C0312042D
	for <lists-other-nbd@bendel.debian.org>; Fri,  9 Oct 2020 12:36:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=4.503 tagged_above=-10000 required=5.3
	tests=[CAPINIT=0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	FREEMAIL_REPLYTO=1, FREEMAIL_REPLYTO_END_DIGIT=0.25, MDO_DATING14=0.1,
	MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, REPLYTO_WITHOUT_TO_CC=1.552,
	UNWANTED_LANGUAGE_BODY=0.03] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mkwl6iKM-yNZ for <lists-other-nbd@bendel.debian.org>;
	Fri,  9 Oct 2020 12:36:01 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from sonic316-11.consmr.mail.bf2.yahoo.com (sonic316-11.consmr.mail.bf2.yahoo.com [74.6.130.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 884EA2035A
	for <nbd@other.debian.org>; Fri,  9 Oct 2020 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602246955; bh=OzNIpnbxSVqwJgBSuenlX5TFVqPK0IDWfx56IWUri8g=; h=Date:From:Reply-To:Subject:References:From:Subject; b=EMX8m/1SJWIJhQK6rkQAtMgfCoZxV6RNbY4AitIZRXQfzdj4UDmbqAzZpYm56nofDlbCwN4ikSeZNG/bPgyx6Coxzgp0kKMPnYQ0HGBbmeOJ4QjR6UINSkTJzNrcmw4jNiFdKpv/XIjCNaIdgNSW+6/eP6wBofehRLi0QpQZYNy7DU/wvI7h625tOtlj1e7RV3HCnCtwnv+cA2EVyUbZxfcxo9Quy48vMq754X2JFc6ntjVeG8eeSTzZR7VYCSdu9/AEbY/MM6CrFAZ1FyYTEU8e7UdhpMdxGFhM2j0V672JwU8fm6gz2WD+PdFONCW3kC9WEeluuXWXA2Vgc7YtTA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602246955; bh=ZmReB4UytnbWm41V6HOHpwqI1NmrQ77nq2EdqBJIY0Z=; h=Date:From:Subject; b=gUKwmEmDHiIkgoZZLBiaIk6p3EegvY6dPGOJl5V9bib3o+9lrdaF3eCm5TeU8rs9eNnTUgrO59m5C7hRhcDxXzuqJT+0Xgl4wIqjQATgobhQLR68HlVeC8hZxXDzrDl06Iy8iPY+V+uT6Gt86g+GwsGJupwjgzQXvBxIbBYqW/YDcReRYf4skk97xKhgz22E+A05UDsQFsIdl6+jisxh0gsMJ+MpYqUOBhaxpzPDz18hfAOXIxgFHWkwICAiGFIY8/eaAatSIlvlgs1AQBJ5grcCRFHlp+89TcfIj/WIzIaTgVlBtqXkbSkK9/rOFLAgWg66J58TuiOvLjl0bdme/A==
X-YMail-OSG: j0UYNEoVM1lF73ZUollHR.QuY3zXJND92oDxxU5x81mlMSJ3A1cGQWmFl0jJT.a
 _UtvvBDZF1kVRXxI0TCKdUaw5lFOzBnFaNccwzpq.Y5frs2pNtXFplMoao7dkYvYFM1_kNLKdoUc
 n_PMWmAO_IIq3Qiz_iFRkiuBAr4ErFzWzbslrPffuKdMChGhuAPuNB2DL0BkgYrbSOAhYOBiNug_
 rbGuZWqlVEz_NseMVPZM2vhcdQpkxkeu7YKG8iNCiHv2RZWT6OrAX.JP9rMZizHy3CpzTyG6NpyL
 VKYZt85Uf6BReozgf7oPMrG9hV1.n5h3X5p9n2enlGOLQlu0D4Le.lOpEMHwknwxHmwXmhXbsDTu
 eyhfHDSuS2ACG5JQ3FxGLZQNUbxzDN2kl9mWWYFb8Xq8VPd8GOAtY5ltrD_2jWLpPkNwP_R_4uKV
 ryxkeCTHNAP1Xmdnu08K97wPyZ93_QJrYr2xT.Eejcc6MzIIHnXzNJJFzJKjnrA6SJwoSdytUz0D
 GGAD6s0GMiK.1ULzquO15OcS3sKVbv7l6Bor6tmzMRFY5RRY.4.en3KkOGog_m3mhb5Kq_y849Ie
 H6zeA8n1r_nOfzoaSSAh4O1HPoEv3MtAsNjYsXz2kW7M3_Iv3UlfpgYhWPyvHvAnkmAOMOYFjWHY
 .w_U0kxB41RD7UBldFN5X8jNkUR_ESgei0Ji0hre4fRrq17iW46qm3FUN.NO1vsSaOizdTha6vB6
 aN6jZcyJjPHorJxYM7anabFNNWsBAWWPf85FgcJ2uXtFmYgs6Lh22kDo2QbROv7xNS1bEz2DX01m
 Z1AG3WYr7bGlOHMrQPFcgavyPm8tWMs8Or63Dpclgj0jxDkdBWrZZuup1dy.5Kzel04IyzslFghs
 GmCpduqsNx0Pna2Z28aIw0Df53cLheTpj2KsgpgD6g0EshJ8b9fSP7g9WGrNUks0mMifVk95_anV
 Kqon9jcNzlp5grFXb60Re3rta.UtHzkcO.Ivx_.dz1vxkfB0cJ8yc7LA3WPWRn0QTfmIT2EP.7Sa
 LaqVTVPMn4AABeWFZ_ttjyPvM3d1a1KbHuYZyw.Hg5lRurjqE2PwvUMNmT6ECjCtHT9YDbInuR5v
 NMG6m28ndFu0yjFQECJtBoFFeMicMd55mv8XQmSL_PmDMaPs.lcg.i2gs9IzgiLZgrUyPs86uxR3
 ClbjbP9MPg3qKJXizC7SKG9Btx3389pjXBmSZJIBTpEZ3qjjWik11ZNJ0xbqdTQqp5XOguuNRy5G
 Ees248hYA3_qaBBOI.1ywLL9lDou3V75SUkr1QHstB0yPL5jhNaFc.ah8yBrqkk6PkIpbFB7OpEX
 0ulX29ikhkbe3p8uh9BC433AB0FqoK_9GweP4yTaAYaPzNWsSh6TNKd2wIOuyMGFYJorE.LB7HjN
 oa2EntDvTNvikbnno130F.GsekvNEXr90MDkWVcRQeWgnt5kXmxg-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.bf2.yahoo.com with HTTP; Fri, 9 Oct 2020 12:35:55 +0000
Date: Fri, 9 Oct 2020 12:35:50 +0000 (UTC)
From: Stephanie Leo <bintoudeme157@yahoo.com>
Reply-To: stephenieleo2020@gmail.com
Message-ID: <1383729546.703457.1602246950323@mail.yahoo.com>
Subject: Von Stephanie
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1383729546.703457.1602246950323.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16795 YMailNodin Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.119 Safari/537.36
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3wtcsqmvebC.A.3fG.HzFgfB@bendel>
To: nbd@other.debian.org
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1012
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1383729546.703457.1602246950323@mail.yahoo.com
Resent-Date: Fri,  9 Oct 2020 12:51:19 +0000 (UTC)



Von Stephanie Leo

Ich schreibe Ihnen diese Nachricht mit Tr=C3=A4nen und Trauer und ich wei=
=C3=9F, dass diese Mail als =C3=9Cberraschung zu Ihnen kommen kann, ich bin=
 Stephanie Leo. Die einzige Tochter. Mein Vater war ein sehr wohlhabender K=
akaoh=C3=A4ndler an der Elfenbeink=C3=BCste aus Abidjan (Elfenbeink=C3=BCst=
e). Mein Vater wurde von seinen Gesch=C3=A4ftspartnern auf einer ihrer Gesc=
h=C3=A4ftsreisen zu Tode vergiftet.

Meine Mutter starb, als ich ein Baby war, und mein Vater hat mich seitdem s=
o besonders aufgenommen. Bevor mein Vater in einem privaten Krankenhaus hie=
r in Abidjan starb, rief er mich heimlich auf seinem Bett an und erz=C3=A4h=
lte mir, dass er die Summe von (7.500.000,00) sieben Millionen f=C3=BCnfhun=
derttausend US-Dorella hatte, die auf einem Festival- / Spannungskonto in A=
s one of Bei den internationalen Banken hier in Abidjan verwendete er meine=
n Namen als seine einzige Tochter f=C3=BCr die n=C3=A4chsten Angeh=C3=B6rig=
en, als er den Fonds einzahlte. Mein verstorbener Vater wies mich an, einen=
 ausl=C3=A4ndischen Partner in einem Land meiner Wahl zu suchen, in dem ich=
 das Geld =C3=BCberweisen und f=C3=BCr Investitionszwecke wie Immobilienver=
waltung oder Hotelverwaltung verwenden w=C3=BCrde.

Ich bitte Sie aufrichtig um Unterst=C3=BCtzung auf folgende Weise: (1) Gebe=
n Sie ein Bankkonto an, auf das dieses Geld =C3=BCberwiesen wird. (2) Als m=
ein Vormund zu dienen. (3) Um zu arrangieren, dass ich in Ihr Land komme, u=
m meine Ausbildung zu f=C3=B6rdern.

Hinweis: Ich bin bereit, Ihnen 20% des Gesamtbetrags als Ausgleich f=C3=BCr=
 Ihre Bem=C3=BChungen / Eintr=C3=A4ge anzubieten, nachdem Sie diesen Fonds =
erfolgreich auf Ihr angegebenes Bankkonto =C3=BCberwiesen haben. Ich erwart=
e bald von Ihnen zu h=C3=B6ren.

Mit freundlichen Gr=C3=BC=C3=9Fen,
Stephanie Leo

