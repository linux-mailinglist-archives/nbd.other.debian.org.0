Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1D8917B80
	for <lists+nbd@lfdr.de>; Wed, 26 Jun 2024 10:57:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 60B202062A; Wed, 26 Jun 2024 08:57:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 26 08:57:10 2024
Old-Return-Path: <ryuusei.nanoha@goo.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,GMAIL,UNDISC_MONEY autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 53F252058C
	for <lists-other-nbd@bendel.debian.org>; Wed, 26 Jun 2024 08:39:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.392 tagged_above=-10000 required=5.3
	tests=[BAYES_80=1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, GMAIL=1,
	T_SCC_BODY_TEXT_LINE=-0.01, UNDISC_MONEY=1.102]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5iv3gTv-erNr for <lists-other-nbd@bendel.debian.org>;
	Wed, 26 Jun 2024 08:39:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 585 seconds by postgrey-1.36 at bendel; Wed, 26 Jun 2024 08:39:10 UTC
Received: from mas-dfr-mts-106c2.mail.goo.jp (mas-dfr-mts-106c2.mail.goo.jp [153.128.190.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DAE5B20594
	for <nbd@other.debian.org>; Wed, 26 Jun 2024 08:39:10 +0000 (UTC)
Received: from mas-ckd-mts-104c5.mail.goo.jp (mas-ckd-mts-104c5.mail.goo.jp [153.128.117.70])
	by mas-dfr-mts-106c2.mail.goo.jp (Postfix) with ESMTP id A19EE180002E7
	for <nbd@other.debian.org>; Wed, 26 Jun 2024 17:29:19 +0900 (JST)
Received: from mas-spm-mts-103c1.ocn.ad.jp (mas-spm-mts-103c1.ocn.ad.jp [153.153.66.227])
	by mas-ckd-mts-104c5.mail.goo.jp (Postfix) with ESMTP id 022CA700008BC;
	Wed, 26 Jun 2024 17:28:44 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=goo.jp; s=20240118;
	t=1719390524; bh=eMsjFSL+AROsJwtPG+4AZB8T5U0sonLijLRWgrD0/eQ=;
	h=To:Subject:From:Date:From;
	b=capbOvSLv2itIbEA7Dweer7hz3OSVUdY5LCai4aA3kWT6lfRbT2JSnMiR4I+lu3Pa
	 NlMcTZDWzle6Cu+PphWHWRwfxOS1nL9G51reQIGo6nf2P7gSbROvqn0kEZ9LLdxlPp
	 9mJQM6wEtmT4AmEc64z8r3Jf3ELKs59n+2TCfMaWui0m8hWP8Njd3fjamZOimUd+UP
	 HFTlI85VYEBIL/0oMT9VgV+Zj+JyYC8kLlkhTo3J2oGEWfIfvDY/EyVfDJM3ZMGl7h
	 0A6xnH1rI/qpBEh5WqJjNX7/+SAEtY/rkctnkcvyv+Nfr+Cd+IhR1+1pttihXvv7EZ
	 6/5PDMNgTE7gw==
Received: from mas-vc-mts-102c1.ocn.ad.jp ([153.138.237.87])
	by mas-spm-mts-103c1.ocn.ad.jp with ESMTP
	id MO1DssMHWhIfVMO1DsvKl9; Wed, 26 Jun 2024 17:28:43 +0900
Received: from mas-sdpx-mts-105c2.mail.goo.jp ([153.128.117.221])
	by mas-vc-mts-102c1.ocn.ad.jp with ESMTP
	id MO1Bs270UR4dXMO1BsMwSG; Wed, 26 Jun 2024 17:28:43 +0900
Received: from md-app-cb005.noc-chibaminato.ocn.ad.jp (md-app-cb005.ocn.ad.jp [153.138.211.201])
	by mas-sdpx-mts-105c2.mail.goo.jp (Postfix) with ESMTP;
	Wed, 26 Jun 2024 17:28:41 +0900 (JST)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: undisclosed-recipients:;
Subject: Kindly reply via abu79aziz@gmail.com
From: Office! <ryuusei.nanoha@goo.jp>
Message-ID: <171938987786.38638.15316714800476359904@goo.jp>
X-Originating-IP: [102.135.174.125]
Date: Wed, 26 Jun 2024 17:28:41 +0900
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XG8VLCHDjuM.A.4ikJ.mf9emB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3086
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/171938987786.38638.15316714800476359904@goo.jp
Resent-Date: Wed, 26 Jun 2024 08:57:10 +0000 (UTC)

Greetings,

I am Abu Aziz from Sudan,

I am interested in relocating to live and invest in your country due to the current war situation in my country.

I am in search of a partner to assist me to get out of Sudan safe and all my money safe where i can put all of it safe. My life here is in real danger. I can't tell how long I can manage to save my life here and my family here.

I will kindly request these things from you please,  you should have an interest and good idea of investment plans like:

(1) Assist in the transfer of the cash to be invested

(2) Advise on lucrative areas for investment.

(3) Assist me in purchase of properties and legal documents

If you agree to render your service to me in this regard, 35% of the
money to be invested will be allocated to you.

Kindly reply me directly here { abu79aziz@gmail.com } if your willing to help me

Thank you..
Aziz

