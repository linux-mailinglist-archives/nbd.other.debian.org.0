Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7102ACC4
	for <lists+nbd@lfdr.de>; Mon, 27 May 2019 03:17:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9CEB12084D; Mon, 27 May 2019 01:17:51 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 27 01:17:51 2019
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3ADF320846
	for <lists-other-nbd@bendel.debian.org>; Mon, 27 May 2019 01:17:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HaVMfGX5WPyQ for <lists-other-nbd@bendel.debian.org>;
	Mon, 27 May 2019 01:17:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CBFC420399
	for <nbd@other.debian.org>; Mon, 27 May 2019 01:17:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 216E3356CD;
	Mon, 27 May 2019 01:17:33 +0000 (UTC)
Received: from [10.72.12.147] (ovpn-12-147.pek2.redhat.com [10.72.12.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E21D25D9D3;
	Mon, 27 May 2019 01:17:31 +0000 (UTC)
Subject: Re: One new nbd-runner project to support the Gluster/Ceph/Azure, etc
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org
References: <6d10eff3-71d7-7174-d267-61e2a6fd1bc5@redhat.com>
 <20190526082330.GB6936@grep.be>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <a6bacbbf-93db-7d08-8867-cb3afa71c4cd@redhat.com>
Date: Mon, 27 May 2019 09:17:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190526082330.GB6936@grep.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 27 May 2019 01:17:33 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kzPC7us-OIJ.A.kGH._qz6cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/534
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a6bacbbf-93db-7d08-8867-cb3afa71c4cd@redhat.com
Resent-Date: Mon, 27 May 2019 01:17:51 +0000 (UTC)

Hey Wouter,




On 2019/5/26 16:23, Wouter Verhelst wrote:
> Hi Xiubo Li,
>
> Sorry for not coming back to you about this yet. It was the first time
> that someone asked for a repository under the NetworkBlockDevice
> umbrella, and I wasn't sure how to handle it yet ;-)
>
> My gut feeling is that this is not really a good fit for the
> NetworkBlockDevice project space on github. Its purpose is to be a
> gateway, rather than a standalone server; to me, that means it does not
> really belong with the reference server etc.
>
> That doesn't mean I don't want to link to your project; I do think it is
> rather cool. But not as a repository in the NetworkBlockDevice umbrella.
No worries and that's okay :-)
Yeah, currently it is using the RPC proto instead, which maybe really 
not a good fit here.

> Instead, I'm going to add a link on the README or some such.
That's very kind of you and always thanks very much for your and 
Richard's help of this.

BRs
Xiubo


> Regards,
>
> On Mon, Mar 25, 2019 at 09:01:30PM +0800, Xiubo Li wrote:
>> Hi ALL,
>>
>> The NBD is one great project :-)
>>
>> Currently there are many Distributed Storages projects such as the Gluster and
>> Ceph are widely use, but they couldn't support NBD directly. For example, for
>> the Gluster, if we want to export the volume file as one NBD block device we
>> must mount the volume first and then use the nbd utils to export it again,
>> which a little ugly.
>>
>> To make it more efficient, we also need one common and generic utils, something
>> like [1], to support them directly. And good news is that I have a working code
>> with most basic things @nbd-runner project[2]. It is hosted under the gluster/
>> currently and I'd like to request a repository under [3] to host this.
>>
>> Now the Gluster handler coding is done,  the Ceph and Azure is in progress now.
>>
>> Thanks
>>
>> Regards,
>> Xiubo Li (@lxbsz)
>>
>> [1] https://github.com/NetworkBlockDevice/nbd
>> [2] https://github.com/gluster/nbd-runner
>> [3] https://github.com/NetworkBlockDevice
>>
>>

