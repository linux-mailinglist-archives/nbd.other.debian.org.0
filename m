Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEDD2C290
	for <lists+nbd@lfdr.de>; Tue, 28 May 2019 11:06:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5F6762059D; Tue, 28 May 2019 09:06:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 28 09:06:11 2019
Old-Return-Path: <yotta.liu@ucloud.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=DATE_IN_PAST_12_24,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RERE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E23D9202E5
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 May 2019 08:50:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.569 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, DATE_IN_PAST_12_24=1.049,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, RERE=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id S94VeBW4C4bB for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 May 2019 08:50:07 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -3.5
Received: from m9784.mail.qiye.163.com (m9784.mail.qiye.163.com [220.181.97.84])
	by bendel.debian.org (Postfix) with ESMTP id 5EC60202D8
	for <nbd@other.debian.org>; Tue, 28 May 2019 08:50:07 +0000 (UTC)
Received: from localhost (unknown [120.132.1.243])
	by m9784.mail.qiye.163.com (Hmail) with ESMTPA id 4128A41B45;
	Tue, 28 May 2019 16:50:03 +0800 (CST)
Date: Tue, 28 May 2019 02:23:23 +0800
From: Yao Liu <yotta.liu@ucloud.cn>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH 2/3] nbd: notify userland even if nbd has already
 disconnected
Message-ID: <20190527182323.GB20702@192-168-150-246.7~>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
 <1558691036-16281-2-git-send-email-yotta.liu@ucloud.cn>
 <20190524130856.zod5agp7hk74pcnr@MacBook-Pro-91.local.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524130856.zod5agp7hk74pcnr@MacBook-Pro-91.local.dhcp.thefacebook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-HM-Spam-Status: e1kIGBQJHllBWUtVQ01DQkJCTExCSUlPSEJNWVdZKFlBSUI3V1ktWUFJV1
	kJDhceCFlBWTU0KTY6NyQpLjc#WQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6Pio4HDg5OiM*SBc3Py4C
	Qh0wCyxVSlVKTk5CS0hIT0tIT0lJVTMWGhIXVQIUDw8aVRcSDjsOGBcUDh9VGBVFWVdZEgtZQVlK
	SUtVSkhJVUpVSU9IWVdZCAFZQUlIQk43Bg++
X-HM-Tid: 0a6afda1d7ae2086kuqy4128a41b45
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4YD6XZUaoEP.A.CTF.DoP7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/537
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190527182323.GB20702@192-168-150-246.7~
Resent-Date: Tue, 28 May 2019 09:06:11 +0000 (UTC)

On Fri, May 24, 2019 at 09:08:58AM -0400, Josef Bacik wrote:
> On Fri, May 24, 2019 at 05:43:55PM +0800, Yao Liu wrote:
> > Some nbd client implementations have a userland's daemon, so we should
> > inform client daemon to clean up and exit.
> > 
> > Signed-off-by: Yao Liu <yotta.liu@ucloud.cn>
> 
> Except the nbd_disconnected() check is for the case that the client told us
> specifically to disconnect, so we don't want to send the notification to
> re-connect because we've already been told we want to tear everything down.
> Nack to this as well.  Thanks,
> 
> Josef
> 

But in userland, client daemon process and process which send disconnect
command are not same process, so they are not clear to each other, so
client daemon expect driver inform it to exit.
In addition, client daemon will get nbd status with nbd_genl_status interface
after it get notified and it should not re-connect if status connected == 0

