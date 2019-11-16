Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 347F5FEAE2
	for <lists+nbd@lfdr.de>; Sat, 16 Nov 2019 07:06:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 14B2D20B44; Sat, 16 Nov 2019 06:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Nov 16 06:06:09 2019
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EE7DA20B38
	for <lists-other-nbd@bendel.debian.org>; Sat, 16 Nov 2019 05:50:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.48 tagged_above=-10000 required=5.3
	tests=[BAYES_20=-1, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cisiyDxxBeiq for <lists-other-nbd@bendel.debian.org>;
	Sat, 16 Nov 2019 05:50:30 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-1.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id 5F5B420B4B
	for <nbd@other.debian.org>; Sat, 16 Nov 2019 05:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573883423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nFrCecqxGljrezuAX5/Vyfjl2ytF0eRdx/OWnRPI/lc=;
	b=Pm46Fv/5fX3olo+RUnUB/2K6JznEtNci4OcGOsxBb9JYs6cbzCKtHo2Oqkvr9Nd0ZpyNs+
	q5SHi1Sr0xD9QxkO8hNECRF6XNBIHxoGfmG/m95fp100IKWC08bPwAkuikfyR0PB30YOuc
	cZPYN/me4S6TV3BMMOcE1EYGZflxVvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-exV4rIO2Nx6i0em8c5CmDQ-1; Sat, 16 Nov 2019 00:50:20 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B9E2477;
	Sat, 16 Nov 2019 05:50:19 +0000 (UTC)
Received: from rh2.redhat.com (ovpn-125-253.rdu2.redhat.com [10.10.125.253])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D11F69183;
	Sat, 16 Nov 2019 05:50:18 +0000 (UTC)
From: Mike Christie <mchristi@redhat.com>
To: nbd@other.debian.org,
	axboe@kernel.dk,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org
Subject: [PATCH 0/2] nbd: local daemon restart support
Date: Fri, 15 Nov 2019 23:50:15 -0600
Message-Id: <20191116055017.6253-1-mchristi@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: exV4rIO2Nx6i0em8c5CmDQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fr3Zzahg7kF.A.RoC.RH5zdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/733
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191116055017.6253-1-mchristi@redhat.com
Resent-Date: Sat, 16 Nov 2019 06:06:09 +0000 (UTC)

The following patches made over Linus's tree allow setups that are
using AF_UNIX sockets with a local daemon to recover from crashes
or to upgrade the daemon while IO is running without having to
disrupt the application (no need to reopen the device or handle IO
errors). They basically just use the existing failover
infrastructure, but to failover to a new socket from a non-dead
socket.


