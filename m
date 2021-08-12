Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CC23EA215
	for <lists+nbd@lfdr.de>; Thu, 12 Aug 2021 11:33:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E54B22038E; Thu, 12 Aug 2021 09:33:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 12 09:33:23 2021
Old-Return-Path: <hch@lst.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=MURPHY_DRUGS_REL8 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 96B8320378
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Aug 2021 09:16:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aLlJjIEkWqdq for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Aug 2021 09:16:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1F2792035A
	for <nbd@other.debian.org>; Thu, 12 Aug 2021 09:16:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5AB5667373; Thu, 12 Aug 2021 11:16:39 +0200 (CEST)
Date: Thu, 12 Aug 2021 11:16:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, hch@lst.de,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	syzbot+9937dc42271cd87d4b98@syzkaller.appspotmail.com
Subject: Re: [PATCH] block: nbd: add sanity check for first_minor
Message-ID: <20210812091639.GA4695@lst.de>
References: <20210812091501.22648-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812091501.22648-1-paskripkin@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <M6x5myt88OP.A.yuG.jrOFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1274
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210812091639.GA4695@lst.de
Resent-Date: Thu, 12 Aug 2021 09:33:23 +0000 (UTC)

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

