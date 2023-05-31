Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCFA717FB2
	for <lists+nbd@lfdr.de>; Wed, 31 May 2023 14:15:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 674972099A; Wed, 31 May 2023 12:15:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 31 12:15:14 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9165F2098F
	for <lists-other-nbd@bendel.debian.org>; Wed, 31 May 2023 11:59:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lqhDf9Fcl33u for <lists-other-nbd@bendel.debian.org>;
	Wed, 31 May 2023 11:59:23 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 69C732098C
	for <nbd@other.debian.org>; Wed, 31 May 2023 11:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685534358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDbpld9EL3JM6YlTC6NfbCHFTt7nQGK8spFq7I3dgUE=;
	b=PndJgYOncDiagmlabJlQFBZFnO+EGlzq8EV+3e2IYqUYwNRz/JT75B8eu+Vcl66d+YQHHI
	FpWsptXpfbLzNSe5EL1GuEbH5bm1/S7s4DG9bd5+iDGHUnZh+cxQPHGr4d55GDt3vogvKP
	PzfF8UHxsAwjMqW8blGfc0x3MG/VWwE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-gthoSIh1OKKia7xYqXyTNg-1; Wed, 31 May 2023 07:59:15 -0400
X-MC-Unique: gthoSIh1OKKia7xYqXyTNg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFE8D185A791;
	Wed, 31 May 2023 11:59:14 +0000 (UTC)
Received: from [10.39.192.34] (unknown [10.39.192.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE948492B0A;
	Wed, 31 May 2023 11:59:13 +0000 (UTC)
Message-ID: <b0f2bed6-dad7-fc89-8116-182abc42d2e6@redhat.com>
Date: Wed, 31 May 2023 13:59:12 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 04/22] states: Prepare to send
 64-bit requests
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-5-eblake@redhat.com>
 <fe50bb15-75f8-f73e-02a5-fce2078ffd4d@redhat.com>
 <d2mrrhsbtrruo4smh5ctmur7r2emw5nxtgyz2a2fbikyxdi3vn@kbpkytscqr4t>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <d2mrrhsbtrruo4smh5ctmur7r2emw5nxtgyz2a2fbikyxdi3vn@kbpkytscqr4t>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <P8O7GIpk2qM.A.z9C.SpzdkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2516
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b0f2bed6-dad7-fc89-8116-182abc42d2e6@redhat.com
Resent-Date: Wed, 31 May 2023 12:15:14 +0000 (UTC)

On 5/30/23 20:18, Eric Blake wrote:
> On Tue, May 30, 2023 at 04:06:32PM +0200, Laszlo Ersek wrote:
>> On 5/25/23 15:00, Eric Blake wrote:
>>> Support sending 64-bit requests if extended headers were negotiated.
>>> This includes setting NBD_CMD_FLAG_PAYLOAD_LEN any time we send an
>>> extended NBD_CMD_WRITE; this is such a fundamental part of the
>>> protocol that for now it is easier to silently ignore whatever value
>>> the user passes in for that bit in the flags parameter of nbd_pwrite
>>> regardless of the current settings in set_strict_mode, rather than
>>> trying to force the user to pass in the correct value to match whether
>>> extended mode is negotiated.  However, when we later add APIs to give
>>> the user more control for interoperability testing, it may be worth
>>> adding a new set_strict_mode control knob to explicitly enable the
>>> client to intentionally violate the protocol (the testsuite added in
>>> this patch would then be updated to match).
>>>
>>> At this point, h->extended_headers is permanently false (we can't
>>> enable it until all other aspects of the protocol have likewise been
>>> converted).
>>>
>>> Support for using FLAG_PAYLOAD_LEN with NBD_CMD_BLOCK_STATUS is less
>>> fundamental, and deserves to be in its own patch.
>>>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>> ---
> 
>>> @@ -364,7 +370,7 @@ struct command {
>>>    uint16_t type;
>>>    uint64_t cookie;
>>>    uint64_t offset;
>>> -  uint32_t count;
>>> +  uint64_t count;
>>>    void *data; /* Buffer for read/write */
>>>    struct command_cb cb;
>>>    bool initialized; /* For read, true if getting a hole may skip memset */
>>
>> (1) Are there places in the code where we currently assign this "count"
>> field back to a uint32_t object, and assume truncation impossible?
> 
> Grepping for '->count' in lib/ and generator/ shows we need to check
> at least:
> 
> generator/states-reply-simple.c:    h->rlen = cmd->count;
> generator/states-reply-simple.c:    cmd->data_seen += cmd->count;
> 
> which are adjustments to size_t and uint32_t variables respectively,
> in response to a server's reply to an NBD_CMD_READ command.  But since
> we never send a server a read request larger than 64M, truncation and
> overflow are not possible in those lines of code (at most one simple
> reply is possible, and code in states-reply-structured.c ensures that
> cmd->data_seen is a saturating variable that never exceeds
> 2*MAX_REQUEST_SIZE).
> 
> There is also pre-series:
> 
> generator/states-issue-command.c:  h->request.count = htobe32 (cmd->count);
> 
> which is specifically updated in this patch to cover extended headers.
> 
>>> +++ b/generator/states-issue-command.c
>>> @@ -41,15 +41,24 @@  ISSUE_COMMAND.START:
>>>      return 0;
>>>    }
>>>
>>> -  h->request.magic = htobe32 (NBD_REQUEST_MAGIC);
>>> -  h->request.flags = htobe16 (cmd->flags);
>>> -  h->request.type = htobe16 (cmd->type);
>>> -  h->request.handle = htobe64 (cmd->cookie);
>>> -  h->request.offset = htobe64 (cmd->offset);
>>> -  h->request.count = htobe32 (cmd->count);
>>> +  /* These fields are coincident between req.compact and req.extended */
>>> +  h->req.compact.flags = htobe16 (cmd->flags);
>>> +  h->req.compact.type = htobe16 (cmd->type);
>>> +  h->req.compact.handle = htobe64 (cmd->cookie);
>>> +  h->req.compact.offset = htobe64 (cmd->offset);
>>
>> What's more, this is a "by the book" common initial sequence! :)
> 
>>
>>> +  if (h->extended_headers) {
>>> +    h->req.extended.magic = htobe32 (NBD_EXTENDED_REQUEST_MAGIC);
>>> +    h->req.extended.count = htobe64 (cmd->count);
>>> +    h->wlen = sizeof (h->req.extended);
>>> +  }
>>> +  else {
>>> +    assert (cmd->count <= UINT32_MAX);
>>> +    h->req.compact.magic = htobe32 (NBD_REQUEST_MAGIC);
>>> +    h->req.compact.count = htobe32 (cmd->count);
>>> +    h->wlen = sizeof (h->req.compact);
>>> +  }
> 
> Indeed, and shows why my efforts to get a sane layout early in the
> series matter, even if it will cause me a bit more rebase churn here
> based on my response to your comments earlier in the series.
> 
>>> @@ -358,6 +356,15 @@ nbd_unlocked_aio_pwrite (struct nbd_handle *h, const void *buf,
>>>        return -1;
>>>      }
>>>    }
>>> +  /* It is more convenient to manage PAYLOAD_LEN by what was negotiated
>>> +   * than to require the user to have to set it correctly.
>>> +   * TODO: Add new h->strict bit to allow intentional protocol violation
>>> +   * for interoperability testing.
>>> +   */
>>> +  if (h->extended_headers)
>>> +    flags |= LIBNBD_CMD_FLAG_PAYLOAD_LEN;
>>> +  else
>>> +    flags &= ~LIBNBD_CMD_FLAG_PAYLOAD_LEN;
>>
>> Nice -- I wanted to ask for:
>>
>>     flags &= ~(uint32_t)LIBNBD_CMD_FLAG_PAYLOAD_LEN;
>>
>> due to LIBNBD_CMD_FLAG_PAYLOAD_LEN having type "int".
>>
>> However: in patch#3, what has type "int" is:
>>
>> +#define NBD_CMD_FLAG_PAYLOAD_LEN (1<<5)
>>
>> and here we have LIBNBD_CMD_FLAG_PAYLOAD_LEN instead -- and the latter
>> has type unsigned int already, from your recent commit 69eecae2c03a
>> ("api: Generate flag values as unsigned", 2022-11-11).
> 
> Still, worth a (separate) cleanup patch to nbd-protocol.h to prefer
> unsigned constants for the flag values where they are not generated.
> 
>>
>> And I think we're fine assuming that uint32_t is unsigned int.
> 
> Not true of all generic C platforms, but certainly true for the
> POSIX-like platforms we target (anyone that defines uint32_t as
> 'unsigned long' on a platform with 32-bit longs is unusual, but even
> then we should still be okay).
> 
>>
>>>
>>>    SET_CALLBACK_TO_NULL (*completion);
>>>    return nbd_internal_command_common (h, flags, NBD_CMD_WRITE, offset, count,
>>> diff --git a/tests/Makefile.am b/tests/Makefile.am
>>> index 3a93251e..8b839bf5 100644
>>> --- a/tests/Makefile.am
>>> +++ b/tests/Makefile.am
>>> @@ -232,6 +232,7 @@ check_PROGRAMS += \
>>>  	closure-lifetimes \
>>>  	pread-initialize \
>>>  	socket-activation-name \
>>> +  pwrite-extended \
>>>  	$(NULL)
>>>
>>>  TESTS += \
>>
>> (2) Incorrect indentation: two spaces rather than one tab.
> 
> Arrgh.  ./.editorconfig is supposed to do this correctly, but
> obviously its interaction with emacs is a bit botched when it comes to
> Makefile syntax.  Will clean up.
> 
>>> +++ b/tests/pwrite-extended.c
> 
>>> +static void
>>> +check (int experr, const char *prefix)
>>> +{
>>> +  const char *msg = nbd_get_error ();
>>> +  int errnum = nbd_get_errno ();
>>> +
>>> +  fprintf (stderr, "error: \"%s\"\n", msg);
>>> +  fprintf (stderr, "errno: %d (%s)\n", errnum, strerror (errnum));
>>> +  if (strncmp (msg, prefix, strlen (prefix)) != 0) {
>>> +    fprintf (stderr, "%s: test failed: missing context prefix: %s\n",
>>> +             progname, msg);
>>> +    exit (EXIT_FAILURE);
>>> +  }
>>> +  if (errnum != experr) {
>>> +    fprintf (stderr, "%s: test failed: "
>>> +             "expected errno = %d (%s), but got %d\n",
>>> +             progname, experr, strerror (experr), errnum);
>>> +    exit (EXIT_FAILURE);
>>> +  }
>>> +}
>>> +
>>> +int
>>> +main (int argc, char *argv[])
>>> +{
>>> +  struct nbd_handle *nbd;
>>> +  const char *cmd[] = {
>>> +    "nbdkit", "-s", "-v", "--exit-with-parent", "memory", "1048576", NULL
>>> +  };
>>> +  uint32_t strict;
>>> +
>>> +  progname = argv[0];
>>> +
>>> +  nbd = nbd_create ();
>>> +  if (nbd == NULL) {
>>> +    fprintf (stderr, "%s\n", nbd_get_error ());
>>
>> (3) Minor inconsistency with check(): we're not printing "progname" here.
>>
>>> +    exit (EXIT_FAILURE);
>>> +  }
>>> +
>>> +  /* Connect to the server. */
>>> +  if (nbd_connect_command (nbd, (char **)cmd) == -1) {
>>> +    fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
>>> +    exit (EXIT_FAILURE);
>>> +  }
>>
>> (4) Another kind of inconsistency: we could use "progname" here, in
>> place of argv[0].
>>
>> (This applies to all other fprintf()s below.)
> 
> Probably copy-and-paste from other similar tests, but I don't mind
> cleaning those up.
> 
>>
>>> +
>>> +  /* FIXME: future API addition to test if server negotiated extended mode.
>>> +   * Until then, strict flags must ignore the PAYLOAD_LEN flag for pwrite,
>>> +   * even though it is rejected for other commands.
>>> +   */
>>> +  strict = nbd_get_strict_mode (nbd);
>>> +  if (!(strict & LIBNBD_STRICT_FLAGS)) {
>>> +    fprintf (stderr, "%s: test failed: "
>>> +             "nbd_get_strict_mode did not have expected flag set\n",
>>> +             argv[0]);
>>> +    exit (EXIT_FAILURE);
>>> +  }
>>
>> Not sure if I understand this check. Per
>> <https://libguestfs.org/nbd_set_strict_mode.3.html>, I take it that
>> LIBNBD_STRICT_FLAGS should be "on" by default. Are you enforcing that?
>> And if so: is it your intent that, *even with* LIBNBD_STRICT_FLAGS, an
>> invalid PAYLOAD_LEN is not rejected (as seen by the libnbd client app),
>> but fixed up silently?
> 
> Rather, until we can tell if the server negotiated extended mode, we
> are ASSUMING that the server did NOT negotiate it, and therefore we
> are in violation of the spec if we send the flag over the wire
> anyways.

OK.

> We can flag all other API where it is inappropriate to ever
> use...
> 
>>
>>> +  if (nbd_aio_pread (nbd, buf, 512, 0, NBD_NULL_COMPLETION,
>>> +                     LIBNBD_CMD_FLAG_PAYLOAD_LEN) != -1) {
>>> +    fprintf (stderr, "%s: test failed: "
>>> +             "nbd_aio_pread did not fail with unexpected flag\n",
>>> +             argv[0]);
>>> +    exit (EXIT_FAILURE);
>>> +  }
>>> +  check (EINVAL, "nbd_aio_pread: ");
>>
>> Ah, got it now. We do want APIs other than pwrite to fail.
> 
> ...but because we don't want to require clients to correctly decide
> when to pass or omit the flag to their API calls (by us masking out
> the user's choice and then hardcoding our actual wire behavior based
> on negotiated mode), passing the flag to pread works even when it
> would be technically wrong over the wire.

I don't understand.

What you describe here (= us fixing up the flag for the caller) applies
to *pwrite*, not *pread*. Furthermore, the above check tests pread's
behavior, and it expects pread to *fail*.

In effect, my understanding of the test code is this:

- assume extended headers have not been negotiated

- require that the NBD connection be created such that it enforces flag
validity on the client side (i.e., "strict mode" including "strict flags")

- test that pread fails with PAYLOAD_LEN -- pread should fail
*regardless* of extended headers having been negotiated, because (a) if
extended headers are not in use, then the flag is altogether invalid,
(b) even with extended headers, a read request does not accept the flag.
Because we don't add "PAYLOAD_LEN" as a valid flag to pread in the
generator code, the check for (b) is always active.

- test that pwrite succeeds with PAYLOAD_LEN -- pwrite should succeed
*regardless* of extended headers having been negotiated, because we set
PAYLOAD_LEN internally, dependent on the extended headers; i.e.,
ignoring the user's argument.

That is, I think I did manage to explain the test to myself, but your
most recent answer confuses me again! :)

> The FIXME does get modified
> again later in the series, when I do add in support for detecting when
> the server supports extended headers.

Right, I assume FIXME in the test code might be addressed together with
the TODO in nbd_unlocked_aio_pwrite(). Once we know whether the server
negotiated extended headers, *and* if the user asks for strictness
regarding the PAYLOAD_LEN flag, we can enforce PAYLOAD_LEN's equivalence
with extended headers in pwrite calls.

Laszlo

> 
>>
>>> +
>>> +  if (nbd_aio_pwrite (nbd, buf, 512, 0, NBD_NULL_COMPLETION,
>>> +                     LIBNBD_CMD_FLAG_PAYLOAD_LEN) == -1) {
>>> +    fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
>>> +    exit (EXIT_FAILURE);
>>> +  }
>>> +
>>> +  if (nbd_aio_pwrite (nbd, buf, 512, 0, NBD_NULL_COMPLETION, 0) == -1) {
>>> +    fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
>>> +    exit (EXIT_FAILURE);
>>> +  }
>>
>> You could contract these into:
>>
>>   if (nbd_aio_pwrite (nbd, buf, 512, 0, NBD_NULL_COMPLETION,
>>                      LIBNBD_CMD_FLAG_PAYLOAD_LEN) == -1 ||
>>       nbd_aio_pwrite (nbd, buf, 512, 0, NBD_NULL_COMPLETION, 0) == -1) {
>>     fprintf (stderr, "%s: %s\n", argv[0], nbd_get_error ());
>>     exit (EXIT_FAILURE);
>>   }
> 
> Sure.
> 
>>
>>> +
>>> +  nbd_close (nbd);
>>> +  exit (EXIT_SUCCESS);
>>> +}
>>
>> In general, I think it's good practice to reach nbd_close() whenever
>> nbd_create() succeeds (that is, on error paths as well, after
>> nbd_create() succeeds). For example, if we connected to the server with
>> systemd socket activation in this test, and (say) one of the pwrites
>> failed, then we'd leak the unix domain socket in the filesystem (from
>> the bind() in "generator/states-connect-socket-activation.c").
>> "sact_sockpath" is unlinked in nbd_close().
>>
>> (As written, this test should not be affected, because, according to
>> unix(7), unix domain sockets created with socketpair(2) are unnamed.)
> 
> Pre-existing in other tests, but a good observation for a followup patch.
> 

