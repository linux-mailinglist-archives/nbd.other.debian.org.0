Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 137FA6AB93D
	for <lists+nbd@lfdr.de>; Mon,  6 Mar 2023 10:06:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C552320767; Mon,  6 Mar 2023 09:06:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar  6 09:06:12 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EE6BF20724
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Mar 2023 08:48:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uRS67lFDHcoB for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Mar 2023 08:48:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id A63DF2037B
	for <nbd@other.debian.org>; Mon,  6 Mar 2023 08:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678092517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcTy6AAGv8f3zCCNsdgXS+H4btu5VdEy3wfrCveIEFs=;
	b=QsQLm7sZXUCmLYhV82xcQ9PyHIUp4cRMRpdY47k0pzgVPAhyCy2Fr8xIOjsnY4WPtFQAg7
	h3gVzVasKiC+XTl1m/lTVHBwvcXRiNKXiJjKZVhkLJQA01Owo9gIgDo+BtKEeyADU33PKK
	CXA1U5exOwyAG9a9/eoFxfrrQwF9/Ak=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-XuCTxh_6PtqBfxDuk9cCsw-1; Mon, 06 Mar 2023 03:48:33 -0500
X-MC-Unique: XuCTxh_6PtqBfxDuk9cCsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A4E1101A521;
	Mon,  6 Mar 2023 08:48:33 +0000 (UTC)
Received: from [10.39.193.0] (unknown [10.39.193.0])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C27F614171C3;
	Mon,  6 Mar 2023 08:48:31 +0000 (UTC)
Message-ID: <2a150935-0a91-ee4e-7cc8-ad227e987fef@redhat.com>
Date: Mon, 6 Mar 2023 09:48:30 +0100
MIME-Version: 1.0
Subject: Re: [Libguestfs] [PATCH v2 1/6] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
Content-Language: en-US
To: Wouter Verhelst <w@uter.be>, Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, nbd@other.debian.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-2-eblake@redhat.com>
 <f350f0ec-34b1-dca7-5bb0-344a6832f327@yandex-team.ru>
 <20230303221740.pdwc6jtozstntih7@redhat.com>
 <ZARVwVaRJbgvv/fO@pc220518.home.grep.be>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <ZARVwVaRJbgvv/fO@pc220518.home.grep.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <B0cMvfabY_J.A.X4F.E0aBkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2353
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2a150935-0a91-ee4e-7cc8-ad227e987fef@redhat.com
Resent-Date: Mon,  6 Mar 2023 09:06:12 +0000 (UTC)

On 3/5/23 09:41, Wouter Verhelst wrote:
> On Fri, Mar 03, 2023 at 04:17:40PM -0600, Eric Blake wrote:
>> On Fri, Dec 16, 2022 at 10:32:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> s-o-b line missed.
>>
>> I'm not sure if the NBD project has a strict policy on including one,
>> but I don't mind adding it.
> 
> I've never required it, mostly because it's something that I myself
> always forget, too, so, *shrug*.
> 
> (if there were a way in git to make it add that automatically, that
> would help; I've looked but haven't found it)
> 

You can point the "commit.template" git-config knob to a particular
file, and then include your S-o-b in that file.

There is also the "-s" ("--signoff") option for git-commit, but I don't
see a git-config knob to make that permanent. (You can always introduce
a git.alias for it though.)

Laszlo

