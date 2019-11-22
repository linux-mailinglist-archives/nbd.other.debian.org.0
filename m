Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 70443106894
	for <lists+nbd@lfdr.de>; Fri, 22 Nov 2019 10:06:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 53D0A20301; Fri, 22 Nov 2019 09:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov 22 09:06:09 2019
Old-Return-Path: <juliano.ferreira@ufsc.br>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FREEMAIL_FORGED_REPLYTO,
	HTML_MESSAGE,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 821562030E
	for <lists-other-nbd@bendel.debian.org>; Fri, 22 Nov 2019 08:50:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.625 tagged_above=-10000 required=5.3
	tests=[DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_REPLYTO=2.095, HTML_MESSAGE=2,
	RCVD_IN_DNSWL_MED=-2.3, UNWANTED_LANGUAGE_BODY=0.03]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fh978zP5UqlU for <lists-other-nbd@bendel.debian.org>;
	Fri, 22 Nov 2019 08:50:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
X-Greylist: delayed 3071 seconds by postgrey-1.36 at bendel; Fri, 22 Nov 2019 08:50:54 UTC
Received: from antispam.setic.ufsc.br (as78.setic.ufsc.br [150.162.2.78])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3B2B320306
	for <nbd@other.debian.org>; Fri, 22 Nov 2019 08:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by antispam.setic.ufsc.br (Vertip Secure Mail) with ESMTP id EAF44383065;
	Fri, 22 Nov 2019 05:59:35 -0200 (BRST)
X-VERTICAL-IP-Quarantine-ID: <D72qgHMazt6h>
X-VERTICAL-IP-SCANNED: Vertip Secure Mail
X-VERTICAL-IP-Spam-Score: 0
Received: from smtp.mail.ufsc.br (smtp.mail.ufsc.br [150.162.2.72])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by out76.setic.ufsc.br (Vertip Secure Mail) with ESMTPS id C0C6F7C00A;
	Fri, 22 Nov 2019 05:59:35 -0200 (BRST)
Received: from webmail.ufsc.br (webmail2016.setic.ufsc.br [150.162.2.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: juliano.ferreira@ufsc.br)
	by smtp.mail.ufsc.br (Postfix) with ESMTPSA id BC880100049;
	Fri, 22 Nov 2019 04:59:34 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ufsc.br; s=mail;
	t=1574409575; bh=j0T3L+JFJP67TEirlT8rRP6fppA+yvZin8Lxsgw7Zqw=;
	h=Date:From:To:Subject:Reply-To:From;
	b=BlZzbPARizxDcHX5rYcbIIPzIhMa18vOIZblfI4krsJbPFP683GsNDf1t62R/YwAz
	 e3sQoApx/YyxQIUCL/4gYAFzycF8hv0U3Hx7viX7vv8mhqjcnAM17wUrXqglW6GV/W
	 87P0cR9n2sLesQfsTy1vd5MbyDtbWCpeyydZt5+I=
Received: from [46.1.33.62]
 via paginas.ufsc.br ([150.162.2.10])
 by webmail.ufsc.br
 with HTTP (HTTP/1.0 POST); Fri, 22 Nov 2019 04:59:34 -0300
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="=_4b3c6eab147c3acec48d1d4e477bdf80"
Date: Fri, 22 Nov 2019 10:59:34 +0300
From: "Banca IMI S.P.A" <juliano.ferreira@ufsc.br>
To: undisclosed-recipients:;
Subject: Finanzielle Hilfe (Darlehen @1,3%)
Organization: Banca IMI S.P.A
Reply-To: info.bancaimi.uk@gmail.com
Mail-Reply-To: info.bancaimi.uk@gmail.com
Message-ID: <66110fee3fed5ef71ba481b708526860@ufsc.br>
X-Sender: juliano.ferreira@ufsc.br
User-Agent: Roundcube Webmail/1.2.7
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4E-LJ7NqJHC.A.FpD.BU61dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/748
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/66110fee3fed5ef71ba481b708526860@ufsc.br
Resent-Date: Fri, 22 Nov 2019 09:06:09 +0000 (UTC)

--=_4b3c6eab147c3acec48d1d4e477bdf80
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8

-- 
Grüße Herr / Frau,

Benötigen Sie finanzielle Unterstützung (Darlehen)?
Sprechen Sie mit uns bei Banca IMI, wir lösen Ihre finanziellen
Probleme.

Unser Zinssatz beträgt 1,3% pa Bitte bewerben Sie sich jetzt und füllen
Sie die folgenden Bewerbungsdetails aus:

Vollständiger Name:____________________
Darlehensbetrag: _______________________
Leihdauer: ___________________
Darlehen Zweck: _________________
Telefon:____________________

Wir warten auf Ihre Bewerbung, damit Ihre Kreditanfrage bearbeitet
werden kann.

Freundliche Grüße
--=_4b3c6eab147c3acec48d1d4e477bdf80
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt; font-family: Verdana,Gen=
eva,sans-serif'>
<p><br /></p>
<div>-- <br />
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace">=
Gr&uuml;&szlig;e Herr / Frau,<br /> <br /> Ben&ouml;tigen Sie finanzielle U=
nterst&uuml;tzung (Darlehen)?<br /> Sprechen Sie mit uns bei Banca IMI, wir=
 l&ouml;sen Ihre finanziellen Probleme.<br /> <br /> Unser Zinssatz betr&au=
ml;gt 1,3% pa Bitte bewerben Sie sich jetzt und f&uuml;llen Sie die folgend=
en Bewerbungsdetails aus:<br /> <br /> Vollst&auml;ndiger Name:____________=
________<br /> Darlehensbetrag: _______________________<br /> Leihdauer: __=
_________________<br /> Darlehen Zweck: _________________<br /> Telefon:___=
_________________<br /> <br /> Wir warten auf Ihre Bewerbung, damit Ihre Kr=
editanfrage bearbeitet werden kann.<br /> <br /> Freundliche Gr&uuml;&szlig=
;e</div>
</div>
</body></html>

--=_4b3c6eab147c3acec48d1d4e477bdf80--

