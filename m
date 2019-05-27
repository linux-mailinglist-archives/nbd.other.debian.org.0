Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F10AF2C308
	for <lists+nbd@lfdr.de>; Tue, 28 May 2019 11:21:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DAA132061C; Tue, 28 May 2019 09:21:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 28 09:21:08 2019
Old-Return-Path: <yotta.liu@ucloud.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=DATE_IN_PAST_12_24,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RERE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 81C5E2051C
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 May 2019 09:03:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.569 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, DATE_IN_PAST_12_24=1.049,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, RERE=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id z4gwOahJ876I for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 May 2019 09:03:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
X-Greylist: delayed 430 seconds by postgrey-1.36 at bendel; Tue, 28 May 2019 09:03:19 UTC
Received: from m97179.mail.qiye.163.com (m97179.mail.qiye.163.com [220.181.97.179])
	by bendel.debian.org (Postfix) with ESMTP id 0FCB02044B
	for <nbd@other.debian.org>; Tue, 28 May 2019 09:03:18 +0000 (UTC)
Received: from localhost (unknown [120.132.1.243])
	by m97179.mail.qiye.163.com (Hmail) with ESMTPA id 02FDBE01982;
	Tue, 28 May 2019 16:56:05 +0800 (CST)
Date: Tue, 28 May 2019 02:29:25 +0800
From: Yao Liu <yotta.liu@ucloud.cn>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH 3/3] nbd: mark sock as dead even if it's the last one
Message-ID: <20190527182925.GC20702@192-168-150-246.7~>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
 <1558691036-16281-3-git-send-email-yotta.liu@ucloud.cn>
 <20190524131714.i3lbkbokad6xmotv@MacBook-Pro-91.local.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524131714.i3lbkbokad6xmotv@MacBook-Pro-91.local.dhcp.thefacebook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-HM-Spam-Status: e1kIGBQJHllBWUtVQ01DQkJCTExCSUlPSEJNWVdZKFlBSUI3V1ktWUFJV1
	kJDhceCFlBWTU0KTY6NyQpLjc#WQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MFE6Qgw4IjgrCCNCIQscMQJR
	Iw9PFDRVSlVKTk5CS0hITE1OSk1MVTMWGhIXVQIUDw8aVRcSDjsOGBcUDh9VGBVFWVdZEgtZQVlK
	SUtVSkhJVUpVSU9IWVdZCAFZQUlISk83Bg++
X-HM-Tid: 0a6afda75c9820bdkuqy02fdbe01982
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ClM9mFr64HB.A.gkE.E2P7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/538
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190527182925.GC20702@192-168-150-246.7~
Resent-Date: Tue, 28 May 2019 09:21:08 +0000 (UTC)

On Fri, May 24, 2019 at 09:17:15AM -0400, Josef Bacik wrote:
> On Fri, May 24, 2019 at 05:43:56PM +0800, Yao Liu wrote:
> > When sock dead, nbd_read_stat should return a ERR_PTR and then we should
> > mark sock as dead and wait for a reconnection if the dead sock is the last
> > one, because nbd_xmit_timeout won't resubmit while num_connections <= 1.
> 
> num_connections is the total number of connections that the device was set up
> with, not how many are left.  Now since we have the dead_conn_timeout timeout
> stuff now which didn't exist when I originally wrote this code I'd be ok with
> doing that, but not the way you have it now.  It would be something more like
> 
> 	if (nbd_disconnected(config) ||
> 	    (config->num_connections <= 1 &&
> 	     !config->dead_conn_timeout)
> 
> instead.  Thanks,
> 
> Josef
> 

Your solution is better indeed.

