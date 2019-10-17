Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 25841DB92C
	for <lists+nbd@lfdr.de>; Thu, 17 Oct 2019 23:42:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0A211205B8; Thu, 17 Oct 2019 21:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 17 21:42:09 2019
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=4.0 tests=FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI,TO_TOO_MANY autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 46E9F204E3
	for <lists-other-nbd@bendel.debian.org>; Thu, 17 Oct 2019 21:26:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5, TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1a-0mbuGqocS for <lists-other-nbd@bendel.debian.org>;
	Thu, 17 Oct 2019 21:26:54 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 10663204CA
	for <nbd@other.debian.org>; Thu, 17 Oct 2019 21:26:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E624A3CD65;
	Thu, 17 Oct 2019 21:26:50 +0000 (UTC)
Received: from [10.10.125.4] (ovpn-125-4.rdu2.redhat.com [10.10.125.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8121B600C8;
	Thu, 17 Oct 2019 21:26:49 +0000 (UTC)
Subject: Re: INFO: task hung in nbd_ioctl
To: "Richard W.M. Jones" <rjones@redhat.com>,
 syzbot <syzbot+24c12fa8d218ed26011a@syzkaller.appspotmail.com>,
 axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, nbd@other.debian.org,
 syzkaller-bugs@googlegroups.com
References: <000000000000b1b1ee0593cce78f@google.com>
 <5D93C2DD.10103@redhat.com> <20191017140330.GB25667@redhat.com>
 <5DA88D2F.7080907@redhat.com> <20191017162829.GA3888@redhat.com>
 <20191017163634.GD726@sol.localdomain> <20191017164908.GC3888@redhat.com>
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5DA8DC98.7000402@redhat.com>
Date: Thu, 17 Oct 2019 16:26:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20191017164908.GC3888@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Thu, 17 Oct 2019 21:26:50 +0000 (UTC)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OtDRvXl-IYB.A.pjB.wAOqdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/711
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5DA8DC98.7000402@redhat.com
Resent-Date: Thu, 17 Oct 2019 21:42:09 +0000 (UTC)

On 10/17/2019 11:49 AM, Richard W.M. Jones wrote:
> On Thu, Oct 17, 2019 at 09:36:34AM -0700, Eric Biggers wrote:
>> On Thu, Oct 17, 2019 at 05:28:29PM +0100, Richard W.M. Jones wrote:
>>> On Thu, Oct 17, 2019 at 10:47:59AM -0500, Mike Christie wrote:
>>>> On 10/17/2019 09:03 AM, Richard W.M. Jones wrote:
>>>>> On Tue, Oct 01, 2019 at 04:19:25PM -0500, Mike Christie wrote:
>>>>>> Hey Josef and nbd list,
>>>>>>
>>>>>> I had a question about if there are any socket family restrictions for nbd?
>>>>>
>>>>> In normal circumstances, in userspace, the NBD protocol would only be
>>>>> used over AF_UNIX or AF_INET/AF_INET6.
>>>>>
>>>>> There's a bit of confusion because netlink is used by nbd-client to
>>>>> configure the NBD device, setting things like block size and timeouts
>>>>> (instead of ioctl which is deprecated).  I think you don't mean this
>>>>> use of netlink?
>>>>
>>>> I didn't. It looks like it is just a bad test.
>>>>
>>>> For the automated test in this thread the test created a AF_NETLINK
>>>> socket and passed it into the NBD_SET_SOCK ioctl. That is what got used
>>>> for the NBD_DO_IT ioctl.
>>>>
>>>> I was not sure if the test creator picked any old socket and it just
>>>> happened to pick one nbd never supported, or it was trying to simulate
>>>> sockets that did not support the shutdown method.
>>>>
>>>> I attached the automated test that got run (test.c).
>>>
>>> I'd say it sounds like a bad test, but I'm not familiar with syzkaller
>>> nor how / from where it generates these tests.  Did someone report a
>>> bug and then syzkaller wrote this test?
>>
>> It's an automatically generated fuzz test.
>>
>> There's rarely any such thing as a "bad" fuzz test.  If userspace
>> can do something that causes the kernel to crash or hang, it's a
>> kernel bug, with very few exceptions (e.g. like writing to
>> /dev/mem).
>>
>> If there are cases that aren't supported, like sockets that don't
>> support a certain function or whatever, then the code needs to check
>> for those cases and return an error, not hang the kernel.
> 
> Oh I see.  In that case I agree, although I believe this is a
> root-only API and root has a lot of ways to crash the kernel, but sure
> it could be fixed to restrict sockets to one of:
> 
>  - AF_LOCAL or AF_UNIX
>  - AF_INET or AF_INET6
>  - AF_INET*_SDP (? no idea what this is, but it's used by nbd-client)
> 

This one as for a infinniband related socket family that never made it
upstream.

It did support the shutdown callout, so I just made my patch check that
the passed in socket support that instead of hard coding the family
names just in case there was some user still using it.

