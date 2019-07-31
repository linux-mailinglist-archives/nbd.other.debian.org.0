Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 915EA7BC3B
	for <lists+nbd@lfdr.de>; Wed, 31 Jul 2019 10:51:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9FE4920245; Wed, 31 Jul 2019 08:51:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul 31 08:51:12 2019
Old-Return-Path: <jthumshirn@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0732820235
	for <lists-other-nbd@bendel.debian.org>; Wed, 31 Jul 2019 08:33:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OR0LvnW1NtDi for <lists-other-nbd@bendel.debian.org>;
	Wed, 31 Jul 2019 08:33:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1085 seconds by postgrey-1.36 at bendel; Wed, 31 Jul 2019 08:33:46 UTC
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.suse.de", Issuer "DigiCert SHA2 High Assurance Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C7A6320233
	for <nbd@other.debian.org>; Wed, 31 Jul 2019 08:33:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 25221AE2C;
	Wed, 31 Jul 2019 08:15:38 +0000 (UTC)
Date: Wed, 31 Jul 2019 10:15:37 +0200
From: Johannes Thumshirn <jthumshirn@suse.de>
To: SunKe <sunke32@huawei.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	kamatam@amazon.com, manoj.br@gmail.com, stable@vger.kernel.org,
	dwmw@amazon.com
Subject: Re: [PATCH] nbd: replace kill_bdev() with __invalidate_device() again
Message-ID: <20190731081536.GB3856@x250>
References: <1564542946-26255-1-git-send-email-sunke32@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1564542946-26255-1-git-send-email-sunke32@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <us-PTtWXnIN.A.4fG.AaVQdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/608
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190731081536.GB3856@x250
Resent-Date: Wed, 31 Jul 2019 08:51:12 +0000 (UTC)

On Wed, Jul 31, 2019 at 11:15:46AM +0800, SunKe wrote:
> CR: https://code.amazon.com/reviews/CR-7629288

Hi, this link isn't accessible for ordinary people, please remove it from the
patch.

-- 
Johannes Thumshirn                            SUSE Labs Filesystems
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
Key fingerprint = EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850

