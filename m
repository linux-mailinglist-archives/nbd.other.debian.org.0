Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E79413B52
	for <lists+nbd@lfdr.de>; Tue, 21 Sep 2021 22:27:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E985020CF1; Tue, 21 Sep 2021 20:27:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 21 20:27:21 2021
Old-Return-Path: <lauren.xw2@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.6 required=4.0 tests=CAPINIT,DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,HTML_MESSAGE,JOBS,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AE8BE20DA7
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Sep 2021 20:10:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.641 tagged_above=-10000 required=5.3
	tests=[BAYES_40=-0.01, CAPINIT=0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	JOBS=1, RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FtVxd3z_y0xJ for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Sep 2021 20:10:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D0CA020D6F
	for <nbd@other.debian.org>; Tue, 21 Sep 2021 20:10:27 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id 138so1233997qko.10
        for <nbd@other.debian.org>; Tue, 21 Sep 2021 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=TE6/sW0nC3jYtDPRc/5rrccEEN+nOyKcsZQVZ0jFOBQ=;
        b=bEeIROYinCPuhkdnSmVXsyDzs8wLwJcGjnyDHCXzPXlRaq4EpxDYYVaUNIyxvpeUHX
         3Wpi31FV97Z+4eQAwnnglmr1M4IQ6zfaN26OuouKiYKjv5pg/1XbZNMEM6Frhqev8yG4
         ldGFP5bh2eDAkiD0ETkvomu4LD0f1s6ze6gtM9yIZTDABrwHI+h004da4eoY8fan8ng7
         6WyTkpUSit08B3LzVEckVElooio+9K7YXkyHa0MvyuEhv0OpBaw5Nm2+56a3LAy6rjqH
         0n2IN+frt9OSSF7VE5kiD04ggcO9Eesz+3fjO72eViLOZ9aeyfIIfBhZSiRYFTLh+IDN
         htwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=TE6/sW0nC3jYtDPRc/5rrccEEN+nOyKcsZQVZ0jFOBQ=;
        b=FaOpN4pc/ejEaCGeuOnUA5R2+TA8KsSf7D/lrz35e1WN1c3F2KJc06MZrzZbSWvIYF
         PZA+SmoI6JT67TmonvNXYwsovZkRoXOOLKGsXEIkCwI3qFhV39wvDYQBOw9XfsP3PUIs
         0ioqAsQKDqpI1/l3ItKybTJsGxdiZR5HWDnKkKbK1HNS5/x3U97sHQrxvyFTWBEsp6ON
         7f2+yiG6QD1oLsVgC83JJvHq/2weV31OtIWuwAjdd0fYixWyFUvhwRm+lnnxBRo/oF7I
         tgvH2q7sigEvWBQygivNJEQwNBopdSC4IxknrwhRqzIUMM+lXgy1T+pAyuI9B2B6dbLI
         SVyQ==
X-Gm-Message-State: AOAM532j5D06zpDCrg6J/BhUCSU6HsTpYHGbkgcLWspSxk2IZcxx77ly
	3dD81ItIyZypCtYUT1g3i9v+03uSvUxV/9SBUMA=
X-Google-Smtp-Source: ABdhPJxvcanvsQGCVCoXPdooAMgilnV1450yvLJNR+yHQBgise3PryKJdB1y5ZH+7dghIxVR8FZpVI7L6biBi9JjItE=
X-Received: by 2002:a25:a285:: with SMTP id c5mr13206585ybi.334.1632255024693;
 Tue, 21 Sep 2021 13:10:24 -0700 (PDT)
MIME-Version: 1.0
Reply-To: careers@chevron-hr.co.uk
From: "Chevron HR, Employment" <lauren.xw2@gmail.com>
Date: Tue, 21 Sep 2021 21:10:13 +0100
Message-ID: <CAO8vseKvM8ezDh9D-jtQS84yQyer4oLy2wkkELM152-9T3NB5w@mail.gmail.com>
Subject: Re: Foreign Job Opportunity
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000ee03e505cc86fce7"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5v9M7Wcu6RM.A.PYC.pAkShB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1515
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAO8vseKvM8ezDh9D-jtQS84yQyer4oLy2wkkELM152-9T3NB5w@mail.gmail.com
Resent-Date: Tue, 21 Sep 2021 20:27:21 +0000 (UTC)

--000000000000ee03e505cc86fce7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ATTN,

    This is to inform you that we are currently hiring foreign
international reputable and experienced applicants on various job positions
available if you are interested kindly apply by sending your CV/r=C3=A9sum=
=C3=A9 to
careers@chevron-hr.co.uk <james.chevron.hr@job4u.com> for more details.

Regards
James Armitage
EMEA Recruitment Team Lead.
HR Chevron Corporation London UK.

--000000000000ee03e505cc86fce7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">ATTN,<br><br>=C2=A0=C2=A0=C2=A0 This =
is to inform you that we are currently hiring foreign international reputab=
le and experienced applicants on various job positions available if you are=
 interested kindly apply by sending your CV/r=C3=A9sum=C3=A9 to=C2=A0 <a hr=
ef=3D"mailto:james.chevron.hr@job4u.com" target=3D"_blank">careers@chevron-=
hr.co.uk</a> for more details.<br><br>Regards<br>James Armitage <br>EMEA Re=
cruitment Team Lead.<br>HR Chevron Corporation London UK.</div></div></div>

--000000000000ee03e505cc86fce7--

