Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A01D7715D4
	for <lists+nbd@lfdr.de>; Sun,  6 Aug 2023 17:18:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6146A20884; Sun,  6 Aug 2023 15:18:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Aug  6 15:18:13 2023
Old-Return-Path: <matt.panaro@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	ATTENDEES_DBSPAM_BODY6,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 941B120880
	for <lists-other-nbd@bendel.debian.org>; Sun,  6 Aug 2023 15:02:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.811 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, ATTENDEES_DBSPAM_BODY6=1,
	BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=2,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id E2reWfS8wPet for <lists-other-nbd@bendel.debian.org>;
	Sun,  6 Aug 2023 15:01:58 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-vk1-xa35.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 637F12087E
	for <nbd@other.debian.org>; Sun,  6 Aug 2023 15:01:58 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-487179c285fso1110812e0c.1
        for <nbd@other.debian.org>; Sun, 06 Aug 2023 08:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691334114; x=1691938914;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uu6rmA5kma7EKVHJ/tK5TljpmQmiCk5QKfeBXvhlerk=;
        b=L9a6YNVb67ERzma7F9XArZVOTUYNtgrPGYbLc5dfdE68KrcPzjdXhzZuxu6NFK3xW1
         aM7rKWCWOEZibNWaTbnyb1PD6btmS57G0cvNy1rUWPAG+vs6FIoWB9pPhoRGiXlI4cMB
         HWV0r5nhoUTqpI1+nfqTc6kWsPnkfD7QKUpPPKGo6gwewMskLvWiACn0M7VtXd/Gh8H/
         qgoODBgIYBen2NfEZmnzIvg1tMYQyuWK+9OQX58fyiWcJU5DMnaFjNv/MyUe94DU6ni+
         /V2YRLcy/mcpXJtPEIfD4zQf3kNP21g6PJ+jKMecIZ34zC1WfRF2v4cRY+C0WPHKaXur
         eCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691334114; x=1691938914;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uu6rmA5kma7EKVHJ/tK5TljpmQmiCk5QKfeBXvhlerk=;
        b=lt7XVADEaEJeMuNr1rK7g3deQQVO5SI2cIeD2TEucq0IEIeVZ7iS3xKEfDj5+lz9td
         5Obm3qb4iMI3PAmJjImID1gnnIuBctTBlKmI0scF8ZrTphz0zh7gSBwgpcH6+JKFg/uc
         BGrEOIaEg4Ns+PD2/YdHOy3+LQmQfwLtWdx7Dl4n4F8YlJvwD5KaUPCPeTQQPT1DsSxx
         eW1KZWO5X1iQFKcnOZrNo2M5ykMXe1d0ZSR2LniY2LWKC0qJnn5rrwT3//Yqgug9bXiZ
         p8KEHWdoLNwFXwe1MUkdhtDblWjQ/XZ/PCZRMeV2x1wkbEON9B/tO1eK3/17tqrvjW6L
         oujg==
X-Gm-Message-State: AOJu0YxPbs2/6viHDrTpKsqnLBPVdVgL/3sSNAFr85Xb6BfJHZI0onE8
	qDQMQgxnacyfSclU6t2Wtwb3sgtWFXQoVmZtIX2/II2xJ8s=
X-Google-Smtp-Source: AGHT+IGNPN94/pmnPF/sLCWTCuTIYIHc8UySDM4Mq0M67VPkhRjAClum/WDCgO4hOJd+f1A9e3t9e6nm7LAlr/p4hTw=
X-Received: by 2002:a1f:c1d1:0:b0:486:f6cd:b8f2 with SMTP id
 r200-20020a1fc1d1000000b00486f6cdb8f2mr3291110vkf.0.1691334114482; Sun, 06
 Aug 2023 08:01:54 -0700 (PDT)
MIME-Version: 1.0
From: Matt Panaro <matt.panaro@gmail.com>
Date: Sun, 6 Aug 2023 11:01:40 -0400
Message-ID: <CAAki=DWsOUdZdUGyAi0uPwf+XTTadJfGFwDeFfVuAJq0OByJVw@mail.gmail.com>
Subject: [PATCH] add option for gnutls priority string
To: nbd@other.debian.org
Content-Type: multipart/alternative; boundary="00000000000017204206024269de"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <g2prJA9y2FM.A.VNG.1m7zkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2594
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAAki=DWsOUdZdUGyAi0uPwf+XTTadJfGFwDeFfVuAJq0OByJVw@mail.gmail.com
Resent-Date: Sun,  6 Aug 2023 15:18:13 +0000 (UTC)

--00000000000017204206024269de
Content-Type: text/plain; charset="UTF-8"

(Sending again because the first time isn't showing up in the mailing list
archives/Im not sure if it successfully went through)

I've started using TLS1.3 certificates for my self-signed infrastructure,
so I wanted to be able to do so with NBD as well.  Assuming I'm
understanding the nbd code and the gnutls code, this is no problem on the
server-side, because the GNUTLS priority string can be provided there; but
in the client, it appears to be hard-coded to TLS1.2 (the
%SERVER_PRECEDENCE directive on the server-side [again, assuming I'm
understanding things correctly] only applies to the cipher-set: not the TLS
version). So this patch introduces a parallel command-line option to
specify a GNUTLS priority-string for the client as well.
I'm not 100% sure it's correct: I'm only providing the code because I think
it's easier to discuss what the issue & fix are if there's actual code to
examine.
I initially ran into this issue when I created TLS1.3 CA/client/server
certs, and got TLS errors running NBD; I then experimented with the
nbd-client executable by `sed`-ing it to replace the PRIORITY string `1.2`
with `1.3` in the binary itself, and was then able to successfully connect;
so I figured it would be better to offer a parallel option (like the
server-side) than to change the hard-coded string in the code-base, or only
add a tls-version command-line option.
PR below, please let me know what you think
(PS this is also how I discovered/fixed the missing `F` option on the
client side [see https://lists.debian.org/nbd/2023/07/msg00021.html ];
which will conflict with this patch)

https://github.com/NetworkBlockDevice/nbd/pull/152

--00000000000017204206024269de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>(Sending again because the first time isn&#39;t showi=
ng up in the mailing list archives/Im not sure if it successfully went thro=
ugh)</div><div><br></div><div>I&#39;ve started using TLS1.3 certificates fo=
r my self-signed=20
infrastructure, so I wanted to be able to do so with NBD as well.=C2=A0=20
Assuming I&#39;m understanding the nbd code and the gnutls code, this is no=
=20
problem on the server-side, because the GNUTLS priority string can be=20
provided there; but in the client, it appears to be hard-coded to TLS1.2
 (the %SERVER_PRECEDENCE directive on the server-side [again, assuming=20
I&#39;m understanding things correctly] only applies to the cipher-set: not=
=20
the TLS version). So this patch introduces a parallel command-line=20
option to specify a GNUTLS priority-string for the client as well.</div><di=
v>I&#39;m
 not 100% sure it&#39;s correct: I&#39;m only providing the code because I =
think
 it&#39;s easier to discuss what the issue &amp; fix are if there&#39;s act=
ual=20
code to examine.</div><div>I initially ran into this issue when I=20
created TLS1.3 CA/client/server certs, and got TLS errors running NBD; I
 then experimented with the nbd-client executable by `sed`-ing it to=20
replace the PRIORITY string `1.2` with `1.3` in the binary itself, and=20
was then able to successfully connect; so I figured it would be better=20
to offer a parallel option (like the server-side) than to change the=20
hard-coded string in the code-base, or only add a tls-version=20
command-line option.</div><div>PR below, please let me know what you think<=
/div><div>(PS this is also how I discovered/fixed the missing `F` option on=
 the client side [see <a href=3D"https://lists.debian.org/nbd/2023/07/msg00=
021.html" target=3D"_blank">https://lists.debian.org/nbd/2023/07/msg00021.h=
tml</a> ]; which will conflict with this patch)<br><br></div><a href=3D"htt=
ps://github.com/NetworkBlockDevice/nbd/pull/152">https://github.com/Network=
BlockDevice/nbd/pull/152</a></div>

--00000000000017204206024269de--

