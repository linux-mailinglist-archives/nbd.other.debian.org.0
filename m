Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EDE2CCAE
	for <lists+nbd@lfdr.de>; Tue, 28 May 2019 18:54:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BD89F206ED; Tue, 28 May 2019 16:54:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 28 16:54:08 2019
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8C68C20094
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 May 2019 16:36:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id d5W8--8rIuEJ for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 May 2019 16:36:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8BD40206A7
	for <nbd@other.debian.org>; Tue, 28 May 2019 16:36:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D27630C1328;
	Tue, 28 May 2019 16:36:24 +0000 (UTC)
Received: from [10.10.126.56] (ovpn-126-56.rdu2.redhat.com [10.10.126.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 549375D6A9;
	Tue, 28 May 2019 16:36:22 +0000 (UTC)
Subject: Re: [PATCH 2/3] nbd: notify userland even if nbd has already
 disconnected
To: Yao Liu <yotta.liu@ucloud.cn>, Josef Bacik <josef@toxicpanda.com>
References: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
 <1558691036-16281-2-git-send-email-yotta.liu@ucloud.cn>
 <20190524130856.zod5agp7hk74pcnr@MacBook-Pro-91.local.dhcp.thefacebook.com>
 <20190527182323.GB20702@192-168-150-246.7~>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 nbd@other.debian.org, linux-kernel@vger.kernel.org
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5CED6385.3000802@redhat.com>
Date: Tue, 28 May 2019 11:36:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20190527182323.GB20702@192-168-150-246.7~>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 28 May 2019 16:36:29 +0000 (UTC)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Fy92LqszChF.A.pFC.weW7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/542
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5CED6385.3000802@redhat.com
Resent-Date: Tue, 28 May 2019 16:54:08 +0000 (UTC)

On 05/27/2019 01:23 PM, Yao Liu wrote:
> On Fri, May 24, 2019 at 09:08:58AM -0400, Josef Bacik wrote:
>> On Fri, May 24, 2019 at 05:43:55PM +0800, Yao Liu wrote:
>>> Some nbd client implementations have a userland's daemon, so we should
>>> inform client daemon to clean up and exit.
>>>
>>> Signed-off-by: Yao Liu <yotta.liu@ucloud.cn>
>>
>> Except the nbd_disconnected() check is for the case that the client told us
>> specifically to disconnect, so we don't want to send the notification to
>> re-connect because we've already been told we want to tear everything down.
>> Nack to this as well.  Thanks,
>>
>> Josef
>>
> 
> But in userland, client daemon process and process which send disconnect
> command are not same process, so they are not clear to each other, so
> client daemon expect driver inform it to exit.
> In addition, client daemon will get nbd status with nbd_genl_status interface
> after it get notified and it should not re-connect if status connected == 0
> 

When using the netlink interface you get the NBD_CMD_LINK_DEAD first
then the configs_refs goes to zero right?

nbd_disconnect_and_put -> sock_shutdown -> nbd_mark_nsock_dead

then later we do the final nbd_config_put?

Maybe it would be best to add a new netlink event to signal what has
happened, because the above nl and stat algorithm seems like a pain. The
NBD_CMD_LINK_DEAD will be sent, then userspace has to possibly poll the
status to check if this was caused due to nbd_genl_disconnect instead of
a downed link due to something like a command timeout, because the
refcount may not be down when userspace gets the NL event.

Or, I guess the admin/tool process could just send a msg to the daemon
process to tell it to do the netlink disconnect request.

