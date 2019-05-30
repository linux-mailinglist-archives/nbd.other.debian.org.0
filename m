Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0B62EA2F
	for <lists+nbd@lfdr.de>; Thu, 30 May 2019 03:22:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C4EA620849; Thu, 30 May 2019 01:22:55 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 30 01:22:55 2019
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E076D20822
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 May 2019 01:22:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4nFnbxMkTIt9 for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 May 2019 01:22:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E22E02081F
	for <nbd@other.debian.org>; Thu, 30 May 2019 01:22:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 463B8C004BEB;
	Thu, 30 May 2019 01:22:41 +0000 (UTC)
Received: from [10.72.12.96] (ovpn-12-96.pek2.redhat.com [10.72.12.96])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE5A11001E80;
	Thu, 30 May 2019 01:22:38 +0000 (UTC)
Subject: Re: [RFC PATCH] nbd: set the default nbds_max to 0
To: Josef Bacik <josef@toxicpanda.com>
Cc: axboe@kernel.dk, nbd@other.debian.org, mchristi@redhat.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 atumball@redhat.com
References: <20190529080836.13031-1-xiubli@redhat.com>
 <20190529134834.t6qjq2nkut37zpsf@MacBook-Pro-91.local>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <63658620-7d1f-f626-b637-8f551ca07f95@redhat.com>
Date: Thu, 30 May 2019 09:22:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529134834.t6qjq2nkut37zpsf@MacBook-Pro-91.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 30 May 2019 01:22:41 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XgomSaIXB4.A.DoF.vBz7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/553
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/63658620-7d1f-f626-b637-8f551ca07f95@redhat.com
Resent-Date: Thu, 30 May 2019 01:22:55 +0000 (UTC)

On 2019/5/29 21:48, Josef Bacik wrote:
> On Wed, May 29, 2019 at 04:08:36PM +0800, xiubli@redhat.com wrote:
>> From: Xiubo Li <xiubli@redhat.com>
>>
>> There is one problem that when trying to check the nbd device
>> NBD_CMD_STATUS and at the same time insert the nbd.ko module,
>> we can randomly get some of the 16 /dev/nbd{0~15} are connected,
>> but they are not. This is because that the udev service in user
>> space will try to open /dev/nbd{0~15} devices to do some sanity
>> check when they are added in "__init nbd_init()" and then close
>> it asynchronousely.
>>
>> Signed-off-by: Xiubo Li <xiubli@redhat.com>
>> ---
>>
>> Not sure whether this patch make sense here, coz this issue can be
>> avoided by setting the "nbds_max=0" when inserting the nbd.ko modules.
>>
> Yeah I'd rather not make this the default, as of right now most people still
> probably use the old method of configuration and it may surprise them to
> suddenly have to do nbds_max=16 to make their stuff work.  Thanks,

Sure, make sense to me :-)

So this patch here in the mail list will as one note and reminder to 
other who may hit the same issue in future.

Thanks.
BRs
Xiubo


> Josef
>

