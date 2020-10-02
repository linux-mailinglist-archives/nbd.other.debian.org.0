Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C074281C97
	for <lists+nbd@lfdr.de>; Fri,  2 Oct 2020 22:07:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3076B203EE; Fri,  2 Oct 2020 20:07:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct  2 20:07:30 2020
Old-Return-Path: <josh@joshtriplett.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_RP_RNBL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 064EE2034F
	for <lists-other-nbd@bendel.debian.org>; Fri,  2 Oct 2020 20:07:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.67 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_RP_RNBL=1.31] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YmlfxNri-D1q for <lists-other-nbd@bendel.debian.org>;
	Fri,  2 Oct 2020 20:07:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6CC08201DF
	for <nbd@other.debian.org>; Fri,  2 Oct 2020 20:07:19 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id D8C1C3B0658
	for <nbd@other.debian.org>; Fri,  2 Oct 2020 20:05:19 +0000 (UTC)
Received: from localhost (50-39-163-217.bvtn.or.frontiernet.net [50.39.163.217])
	(Authenticated sender: josh@joshtriplett.org)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6E794240003
	for <nbd@other.debian.org>; Fri,  2 Oct 2020 20:04:55 +0000 (UTC)
Date: Fri, 2 Oct 2020 13:04:53 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: nbd@other.debian.org
Subject: Re: [PATCH 1/2] Add option to treat device as read-only
Message-ID: <20201002200453.GA286250@localhost>
References: <20200701071038.GA301687@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701071038.GA301687@localhost>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hexSsUHLS0O.A.7ZF.Ci4dfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1009
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201002200453.GA286250@localhost
Resent-Date: Fri,  2 Oct 2020 20:07:30 +0000 (UTC)

Following up on this: I'm still interested in pursuing these two
patches. I'd love to get these merged, or find out what could be
improved to get them merged.

