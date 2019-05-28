Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0742DB01
	for <lists+nbd@lfdr.de>; Wed, 29 May 2019 12:48:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B16F4207FB; Wed, 29 May 2019 10:48:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 10:48:18 2019
Old-Return-Path: <yotta.liu@ucloud.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DATE_IN_PAST_12_24,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5D52D20806
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2019 10:32:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.931 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DATE_IN_PAST_12_24=1.049, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ZtqSrjMFhFPg for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2019 10:32:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from m97179.mail.qiye.163.com (m97179.mail.qiye.163.com [220.181.97.179])
	by bendel.debian.org (Postfix) with ESMTP id 5649120804
	for <nbd@other.debian.org>; Wed, 29 May 2019 10:32:39 +0000 (UTC)
Received: from localhost (unknown [120.132.1.243])
	by m97179.mail.qiye.163.com (Hmail) with ESMTPA id 1966BE01AC1;
	Wed, 29 May 2019 18:32:33 +0800 (CST)
Date: Wed, 29 May 2019 04:05:54 +0800
From: Yao Liu <yotta.liu@ucloud.cn>
To: Mike Christie <mchristi@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nbd: notify userland even if nbd has already
 disconnected
Message-ID: <20190528200554.GA21633@192-168-150-246.7~>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
 <1558691036-16281-2-git-send-email-yotta.liu@ucloud.cn>
 <20190524130856.zod5agp7hk74pcnr@MacBook-Pro-91.local.dhcp.thefacebook.com>
 <20190527182323.GB20702@192-168-150-246.7~>
 <5CED6385.3000802@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5CED6385.3000802@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-HM-Spam-Status: e1kIGBQJHllBWUtVQ01JQkJCQ05NT0xJS0pOWVdZKFlBSUI3V1ktWUFJV1
	kJDhceCFlBWTU0KTY6NyQpLjc#WQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nxw6USo*Vjg0OiI9KgoSPyhD
	OBNPCzhVSlVKTk5CSklOQk5ISUtIVTMWGhIXVQIUDw8aVRcSDjsOGBcUDh9VGBVFWVdZEgtZQVlK
	SUtVSkhJVUpVSU9IWVdZCAFZQUhOTk83Bg++
X-HM-Tid: 0a6b03260a5320bdkuqy1966be01ac1
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EruiWHFEwYF.A.kX.yNm7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/548
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190528200554.GA21633@192-168-150-246.7~
Resent-Date: Wed, 29 May 2019 10:48:18 +0000 (UTC)

On Tue, May 28, 2019 at 11:36:21AM -0500, Mike Christie wrote:
> On 05/27/2019 01:23 PM, Yao Liu wrote:
> > On Fri, May 24, 2019 at 09:08:58AM -0400, Josef Bacik wrote:
> >> On Fri, May 24, 2019 at 05:43:55PM +0800, Yao Liu wrote:
> >>> Some nbd client implementations have a userland's daemon, so we should
> >>> inform client daemon to clean up and exit.
> >>>
> >>> Signed-off-by: Yao Liu <yotta.liu@ucloud.cn>
> >>
> >> Except the nbd_disconnected() check is for the case that the client told us
> >> specifically to disconnect, so we don't want to send the notification to
> >> re-connect because we've already been told we want to tear everything down.
> >> Nack to this as well.  Thanks,
> >>
> >> Josef
> >>
> > 
> > But in userland, client daemon process and process which send disconnect
> > command are not same process, so they are not clear to each other, so
> > client daemon expect driver inform it to exit.
> > In addition, client daemon will get nbd status with nbd_genl_status interface
> > after it get notified and it should not re-connect if status connected == 0
> > 
> 
> When using the netlink interface you get the NBD_CMD_LINK_DEAD first
> then the configs_refs goes to zero right?
> 
> nbd_disconnect_and_put -> sock_shutdown -> nbd_mark_nsock_dead
> 
> then later we do the final nbd_config_put?
> 
> Maybe it would be best to add a new netlink event to signal what has
> happened, because the above nl and stat algorithm seems like a pain. The
> NBD_CMD_LINK_DEAD will be sent, then userspace has to possibly poll the
> status to check if this was caused due to nbd_genl_disconnect instead of
> a downed link due to something like a command timeout, because the
> refcount may not be down when userspace gets the NL event.
> 
> Or, I guess the admin/tool process could just send a msg to the daemon
> process to tell it to do the netlink disconnect request.
> 

Adding a new netlink event sames good.

