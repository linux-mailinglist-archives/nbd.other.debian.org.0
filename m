Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 04552715D28
	for <lists+nbd@lfdr.de>; Tue, 30 May 2023 13:27:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BAA5720867; Tue, 30 May 2023 11:27:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 30 11:27:12 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MONEY,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,STOCKLIKE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5A3B72083D
	for <lists-other-nbd@bendel.debian.org>; Tue, 30 May 2023 11:09:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.751 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.161, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MONEY=0.5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	STOCKLIKE=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qsWnVLslp-VM for <lists-other-nbd@bendel.debian.org>;
	Tue, 30 May 2023 11:09:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 7A5322084B
	for <nbd@other.debian.org>; Tue, 30 May 2023 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685444959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g73MwGhclWH1366vL0n5DOw6rQ8wF6E452Fef3c3hHI=;
	b=QuQNn/hsqgPDaZNFVdEs/5fP7pZpRYZwDhfDIlTYcA7lbx9Jbar+gvbINA0eR5/Qjnl7lA
	1NgNT9Ux233Rw0FZjZxyj9POOdmPEtoUgSVOYFfJvcdNMEhBMHwK+hOyhrSDVJtJG7pnhZ
	DXCHsoBhll70j2R2Xx/cVxcz+6h853o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-CL-KOpYyOo6lBlFOuuxD2g-1; Tue, 30 May 2023 07:09:17 -0400
X-MC-Unique: CL-KOpYyOo6lBlFOuuxD2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B725B80231B;
	Tue, 30 May 2023 11:09:16 +0000 (UTC)
Received: from [10.39.195.136] (unknown [10.39.195.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D891E421C3;
	Tue, 30 May 2023 11:09:15 +0000 (UTC)
Message-ID: <8e0270f2-9575-13b9-9f38-9e6ab01f6e4d@redhat.com>
Date: Tue, 30 May 2023 13:09:14 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 02/22] internal: Refactor layout of
 replies in sbuf
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-3-eblake@redhat.com>
 <1fa92626-e5ac-5e95-f697-88804020ad46@redhat.com>
 <4whjuq2zatnxltmrz4tjq2qey3yl5a3z42ac7vykffem47u4yr@4mmvwm2vlqaj>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <4whjuq2zatnxltmrz4tjq2qey3yl5a3z42ac7vykffem47u4yr@4mmvwm2vlqaj>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------SVzDP7UmGW0Rc0tNUvpE1Y9P"
Content-Language: en-US
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <V9fNNTPIxEK.A.OZF.Q2ddkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2507
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/8e0270f2-9575-13b9-9f38-9e6ab01f6e4d@redhat.com
Resent-Date: Tue, 30 May 2023 11:27:12 +0000 (UTC)

This is a multi-part message in MIME format.
--------------SVzDP7UmGW0Rc0tNUvpE1Y9P
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/26/23 23:06, Eric Blake wrote:

> I should indeed try harder to follow your useful example of generating
> specific patches with more than the default 3 lines of context, when
> it would make review easier.  Alas, 'git format-patch' doesn't seem to
> have an easy way to pick a different context size on a per-patch
> basis, so this basically implies writing (or finding and reusing
> existing) wrapper tooling to automate that.

If it's of any help, please see my script attached. It lets me put
"context:-W" and "context:-U5" style hints in the Notes sections of the
patches (with git-notes).

>>> diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
>>> index 96182222..6f96945a 100644
>>> --- a/generator/states-reply-structured.c
>>> +++ b/generator/states-reply-structured.c
>>> @@ -49,9 +49,9 @@  REPLY.STRUCTURED_REPLY.START:
>>>     * so read the remaining part.
>>>     */
>>>    h->rbuf = &h->sbuf;
>>> -  h->rbuf = (char *)h->rbuf + sizeof h->sbuf.simple_reply;
>>> -  h->rlen = sizeof h->sbuf.sr.structured_reply;
>>> -  h->rlen -= sizeof h->sbuf.simple_reply;
>>> +  h->rbuf = (char *)h->rbuf + sizeof h->sbuf.reply.hdr.simple;
>>> +  h->rlen = sizeof h->sbuf.reply.hdr.structured;
>>> +  h->rlen -= sizeof h->sbuf.reply.hdr.simple;
>>>    SET_NEXT_STATE (%RECV_REMAINING);
>>>    return 0;
>>>
>>
>> Here I disagree with the mechanical approach.
>>
>> I even take issue with the pre-patch code. Pre-patch, we fill in
>> "h->sbuf.simple_reply" (in "generator/states-reply.c"), i.e., one member
>> of the top-level "sbuf" union, but then continue filling a member of a
>> *different* member (i.e., "sr.structured_reply") of the "sbuf" union
>> here. This looks undefined by the C standard, but even if it's not
>> undefined, it's supremely confusing.
> 
> It happens to work, but I agree with you that we are probably
> stretching aliasing rules about memory effective types that it is
> shaky ground to begin with.  Even adding a STATIC_ASSERT that
> offsetof(struct simple_reply, handle) == offsetof(struct
> structured_reply, handle) would be helpful to show that we depend on
> that.

After I sent my comments last week, I kept pondering this topic. I now
believe my approach to unions in this instance was too rigid. The code
is not trivial to read for sure, but there are code comments that help
with that. If you can introduce that STATIC_ASSERT, IMO that will
suffice, for sticking with this patch.

(

Given that we already depend on (non-standard) packing, and depend on
the accesses to those packed fields not to fault, it's mostly irrelevant
how exactly we calculate the byte offsets.

It's really difficult to use unions effectively, if one doesn't go
beyond what the standard guarantees. :/

)

Thanks,
Laszlo

--------------SVzDP7UmGW0Rc0tNUvpE1Y9P
Content-Type: text/plain; charset=UTF-8; name="git-format-series"
Content-Disposition: attachment; filename="git-format-series"
Content-Transfer-Encoding: base64

IyEvYmluL2Jhc2gKc2V0IC1lIC11IC1DCgojIEFzc3VtZSBhbGwgYXJndW1lbnRzIGV4Y2VwdCB0
aGUgbGFzdCBvbmUgYXJlIGdpdC1mb3JtYXQtcGF0Y2ggb3B0aW9ucy4Kb3B0aW9ucz0oIiR7QDox
OigkIy0xKX0iKQoKIyBBc3N1bWUgdGhlIGxhc3QgYXJndW1lbnQgaXMgdGhlIG9uZSBvcGVyYW5k
IGZvciBnaXQtZm9ybWF0LXBhdGNoOiB0aGUgcmV2aXNpb24KIyBzZXQuCnJldmlzaW9ucz0ke0A6
KC0xKX0KCiMgRmV0Y2ggdGhlIGFycmF5IG9mIHJldmlzaW9ucyAod2l0aCBhYmJyZXZpYXRlZCBo
YXNoZXMpIGluIGluY3JlYXNpbmcgb3JkZXIuCnJldl9saXN0PSgkKGdpdCBsb2cgLS1yZXZlcnNl
IC0tZm9ybWF0PXRmb3JtYXQ6JWggIiRyZXZpc2lvbnMiKSkKCiMgQ3JlYXRlIHRlbXBvcmFyeSBk
aXJlY3RvcnkuCnRtcGQ9JChta3RlbXAgLWQpCnRyYXAgJ3JtIC1yIC0tICIkdG1wZCInIEVYSVQK
CiMgSWYgdGhlIE5vdGVzIHNlY3Rpb24gb2YgYSBwYXRjaCBjb250YWlucyAiY29udGV4dDotVTMi
LCAiY29udGV4dDotVTgiIGV0Yywgb3IKIyAiY29udGV4dDotVyIgbGluZXMsIHJldHVybiB0aG9z
ZSBsaW5lcy4gVGhlICJnaXQgbm90ZXMgc2hvdyIgb3V0cHV0IGlzCiMgZXhwZWN0ZWQgb24gc3Rk
aW4uCmZpbHRlcl9jb250ZXh0X29wdHMoKQp7CiAgc2VkIC1uIC1yIC1lICdzL15jb250ZXh0Oigt
VVswLTldK3wtVykkL1wxL3AnCn0KCiMgSW4gdGhlIGRpcmVjdG9yeSBnaXZlbiBieSAkMSwgZXhw
YW5kICogaW50byBhbiBhcnJheSwgdGhlbiBwcmludCB0aGUgZWxlbWVudAojIHdpdGggc3Vic2Ny
aXB0ICQyIHRvIHN0ZG91dC4gVGhlIHByaW50ZWQgZWxlbWVudCB3aWxsIGJlIHF1YWxpZmllZCB3
aXRoIHRoZQojIGNvbnRhaW5pbmcgZGlyZWN0b3J5ICQxLgpnZXRfbnRoX2ZpbGUoKQp7CiAgbG9j
YWwgZGlyPSQxCiAgbG9jYWwgb2ZzPSQyCiAgbG9jYWwgZmxpc3Q9KCIkZGlyIi8qKQoKICBwcmlu
dGYgJyVzXG4nICR7Zmxpc3RbIiRvZnMiXX0KfQoKIyBDb2xsZWN0IGFsbCB0aGUgY29udGV4dCBv
cHRpb25zIHVzZWQgb3ZlciB0aGUgc2VyaWVzIGludG8gYW4gYXJyYXkuIFRoZQojIGRlZmF1bHQg
Ii1VMyIgY29udGV4dCBvcHRpb24gd2lsbCBiZSBmb3JjaWJseSBnZW5lcmF0ZWQuCmFsbF9jb250
ZXh0X29wdHM9KCQoCiAgKAogICAgZm9yIHJldiBpbiAiJHtyZXZfbGlzdFtAXX0iOyBkbwogICAg
ICBnaXQgbm90ZXMgc2hvdyAiJHJldiIgMj4vZGV2L251bGwgfHwgdHJ1ZQogICAgZG9uZSBcCiAg
ICB8IGZpbHRlcl9jb250ZXh0X29wdHMKCiAgICBwcmludGYgJyVzXG4nIC1VMwogICkgXAogIHwg
c29ydCAtdQopKQoKIyBGb3IgZWFjaCBmb3VuZCBjb250ZXh0IG9wdGlvbiwgZm9ybWF0IHRoZSBl
bnRpcmUgc2VyaWVzLCBpbnRvIGEgZGVkaWNhdGVkCiMgc3ViZGlyZWN0b3J5LCB1c2luZyB0aGUg
Y2FsbGVyLXNwZWNpZmllZCBvcHRpb25zIGFuZCByZXZpc2lvbiBzZXQuIChGb3JtYXQgYQojIGNv
dmVyIGxldHRlciBhcyB3ZWxsLikgVW5mb3J0dW5hdGVseSwgdGhpcyBpcyBuZWNlc3NhcnkgYmVj
YXVzZSB0aGUgIi9tIiBwYXJ0CiMgaW4gIltQQVRDSCB2MyBuL21dIiBkZXBlbmRzIG9uICphbGwq
IHBhdGNoZXMgYmVpbmcgZm9ybWF0dGVkIGluIG9uZSBnby4KZm9yIGNvbnRleHRfb3B0IGluICIk
e2FsbF9jb250ZXh0X29wdHNbQF19IjsgZG8KICBta2RpciAtLSAiJHRtcGQvY29udGV4dCRjb250
ZXh0X29wdCIKICBnaXQgZm9ybWF0LXBhdGNoIC0tbm90ZXMgLS1jb3Zlci1sZXR0ZXIgLS1udW1i
ZXJlZCAtLXN0YXQ9MTAwMCBcCiAgICAgIC0tc3RhdC1ncmFwaC13aWR0aD0yMCAtLW91dHB1dC1k
aXJlY3RvcnkgIiR0bXBkL2NvbnRleHQkY29udGV4dF9vcHQiIFwKICAgICAgIiRjb250ZXh0X29w
dCIgIiR7b3B0aW9uc1tAXX0iICIkcmV2aXNpb25zIiA+L2Rldi9udWxsCmRvbmUKCiMgSXRlcmF0
ZSBvdmVyIHRoZSBjb3ZlciBsZXR0ZXIgYW5kIGFsbCB0aGUgcmV2aXNpb25zLiBGb3IgZWFjaCwg
ZGV0ZXJtaW5lIHRoZQojIGNvbnRleHQgb3B0aW9uLiAoRm9yIHRoZSBjb3ZlciBsZXR0ZXIsIGFu
ZCBmb3IgcmV2aXNpb25zIHdpdGhvdXQgYQojICJjb250ZXh0Oi4uLiIgbGluZSBpbiB0aGUgTm90
ZXMgc2VjdGlvbiwgYXNzdW1lIC1VMy4gSWYgYSByZXZpc2lvbiBoYXMKIyBtdWx0aXBsZSAiY29u
dGV4dDouLi4iIGxpbmVzIGluIHRoZSBOb3RlcyBzZWN0aW9uLCBwaWNrIHRoZSBmaXJzdCBvbmUu
KSBPbmNlCiMgdGhlIGNvbnRleHQgb3B0aW9uIGhhcyBiZWVuIGRldGVybWluZWQsICpwb3NpdGlv
bmFsbHkqIGxvb2sgdXAgdGhlIGZvcm1hdHRlZAojIHBhdGNoIGVtYWlsIHRoYXQgY29ycmVzcG9u
ZHMgdG8gdGhlIGNvdmVyIGxldHRlciBvciB0aGUgcmV2aXNpb24sIGluIHRoZQojIHN1YmRpcmVj
dG9yeSB0aGF0IGNvcnJlc3BvbmRzIHRvIHRoZSBjb250ZXh0IG9wdGlvbi4KcGF0Y2hucj0wCmZv
ciByZXYgaW4gY292ZXJfbGV0dGVyICIke3Jldl9saXN0W0BdfSI7IGRvCiAgaWYgdGVzdCBjb3Zl
cl9sZXR0ZXIgPSAiJHJldiI7IHRoZW4KICAgIGNvbnRleHRfb3B0PQogIGVsc2UKICAgIGNvbnRl
eHRfb3B0PSQoCiAgICAgIGdpdCBub3RlcyBzaG93ICIkcmV2IiAyPi9kZXYvbnVsbCBcCiAgICAg
IHwgZmlsdGVyX2NvbnRleHRfb3B0cyBcCiAgICAgIHwgaGVhZCAtMQogICAgKQogIGZpCiAgaWYg
dGVzdCAteiAiJGNvbnRleHRfb3B0IjsgdGhlbgogICAgY29udGV4dF9vcHQ9LVUzCiAgZmkKICBm
aWxlPSQoZ2V0X250aF9maWxlICIkdG1wZC9jb250ZXh0JGNvbnRleHRfb3B0IiAiJHBhdGNobnIi
KQogIGNhdCAtLSAiJGZpbGUiCiAgaWYgdGVzdCAkcGF0Y2huciAtZ3QgMCAmJiB0ZXN0ICRwYXRj
aG5yIC1sdCAkeyNyZXZfbGlzdFtAXX07IHRoZW4KICAgIHByaW50ZiAnXG4nCiAgZmkKICBwYXRj
aG5yPSQoKCRwYXRjaG5yICsgMSkpCmRvbmUK
--------------SVzDP7UmGW0Rc0tNUvpE1Y9P--

